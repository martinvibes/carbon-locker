interface NFTCardProps {
    id: string;
    description: string;
    status: string;
  }
  
  const NFTCard = ({ id, description, status }: NFTCardProps) => (
    <div className="border p-4 rounded-md shadow-sm">
      <h3>NFT #{id}</h3>
      <p>{description}</p>
      <span>Status: {status}</span>
    </div>
  );
  
  export default NFTCard;
  