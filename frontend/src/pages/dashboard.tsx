import useMockData from "../hooks/useMockData";

const Dashboard = () => {
  const { getLocks, getNFTs } = useMockData();
  const locks = getLocks();
  const nfts = getNFTs();

  return (
    <div>
      <h1>My Dashboard</h1>
      <section>
        <h2>Locks</h2>
        <ul>
          {locks.map((lock) => (
            <li key={lock.id}>
              Token {lock.tokenId}: {lock.amount} locked for {lock.duration} (
              {lock.status})
            </li>
          ))}
        </ul>
      </section>
      <section>
        <h2>NFT Certificates</h2>
        <ul>
          {nfts.map((nft) => (
            <li key={nft.id}>
              {nft.id}: {nft.description} ({nft.status})
            </li>
          ))}
        </ul>
      </section>
    </div>
  );
};

export default Dashboard;
