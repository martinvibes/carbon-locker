import Link from "next/link";

const HomePage = () => {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gray-100 text-gray-800">
      <h1 className="text-4xl font-bold mb-8">Welcome to Carbon Locker DApp</h1>
      <p className="mb-4 text-lg">Manage your carbon credits effortlessly:</p>
      <div className="flex space-x-4">
        <Link href="/locker" className="px-6 py-3 bg-blue-500 text-white rounded hover:bg-blue-600">
          Go to Locker
        </Link>
        <Link href="/dashboard" className="px-6 py-3 bg-green-500 text-white rounded hover:bg-green-600">
          View Dashboard
        </Link>
      </div>
    </div>
  );
};

export default HomePage;
