#[starknet::component]
mod LockerComponent {
    // Core imports
    use core::hash::LegacyHash;

    // Starknet imports

    use starknet::{ContractAddress, get_caller_address, get_contract_address};

    // Internal imports
    use carbon_locker::components::locker::interface::ILockerHandler;


    // Roles
    use openzeppelin::access::accesscontrol::interface::IAccessControl;

    // ERC20
    use openzeppelin::token::erc20::interface::{IERC20Dispatcher, IERC20DispatcherTrait};

    // Constants
    use carbon_v3::contracts::project::Project::OWNER_ROLE;

    #[derive(Copy, Drop, Debug, Hash, starknet::Store, Serde, PartialEq)]
    struct Allocation {
        claimee: ContractAddress,
        amount: u128,
        timestamp: u128,
        id: u128
    }

    #[storage]
    struct Storage {
        locked_credits: LegacyMap<
            (ContractAddress, u256), (u256, u256)
        >, // (user, token_id) => (amount, unlock_time)
        staking_rewards: LegacyMap<(ContractAddress, u256), u256>, // (user, token_id) => rewards
        reward_rate: u256,
        penalty_rate: u256,
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {}

    mod Errors {
        const MISSING_ROLE: felt252 = 'Locker: Missing role';
    }

    #[embeddable_as(LockerHandlerImpl)]
    impl LockerHandler<
        TContractState,
        +HasComponent<TContractState>,
        +Drop<TContractState>,
        +IAccessControl<TContractState>
    > of ILockerHandler<ComponentState<TContractState>> {
        fn lock_credits(
            ref self: ComponentState<TContractState>,
            token_id: u256,
            amount: u256,
            lock_duration: u256
        ) {}

        /// Checks if the lock period has expired for a user's locked credits.
        fn is_lock_expired(
            self: @ComponentState<TContractState>, user: ContractAddress, token_id: u256
        ) -> bool {
            return false;
        }

        /// Initiates the offsetting of locked credits after the lock period.
        fn offset_credits(ref self: ComponentState<TContractState>, token_id: u256) {}

        /// Retrieves the details of locked credits for a user.
        fn get_locked_credits(
            self: @ComponentState<TContractState>, user: ContractAddress, token_id: u256
        ) -> (u256, u256) {
            return (0, 0);
        }

        /// Allows the user to withdraw credits before the lock period ends with a penalty.
        fn early_withdraw(ref self: ComponentState<TContractState>, token_id: u256) {}
    }

    #[generate_trait]
    impl InternalImpl<
        TContractState,
        +HasComponent<TContractState>,
        +Drop<TContractState>,
        +IAccessControl<TContractState>
    > of InternalTrait<TContractState> {
        fn initializer(
            ref self: ComponentState<TContractState>, carbonable_project_address: ContractAddress,
        ) {}

        fn assert_only_role(self: @ComponentState<TContractState>, role: felt252) {
            // [Check] Caller has role
            let caller = get_caller_address();
            let has_role = self.get_contract().has_role(role, caller);
            assert(has_role, Errors::MISSING_ROLE);
        }
    }
}
