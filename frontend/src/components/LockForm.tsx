interface LockFormProps {
    onSubmit: (data: { tokenId: string; amount: number; duration: number }) => void;
  }
  
  const LockForm = ({ onSubmit }: LockFormProps) => {
    const handleSubmit = (event: React.FormEvent) => {
      event.preventDefault();
      const form = event.target as HTMLFormElement;
      const formData = new FormData(form);
  
      const tokenId = formData.get("tokenId") as string;
      const amount = Number(formData.get("amount"));
      const duration = Number(formData.get("duration"));
  
      onSubmit({ tokenId, amount, duration });
      form.reset();
    };
  
    return (
      <form onSubmit={handleSubmit}>
        <label>
          Token ID:
          <input type="text" name="tokenId" required />
        </label>
        <label>
          Amount:
          <input type="number" name="amount" min="1" required />
        </label>
        <label>
          Lock Duration (days):
          <input type="number" name="duration" min="1" required />
        </label>
        <button type="submit">Lock Tokens</button>
      </form>
    );
  };
  
  export default LockForm;
  