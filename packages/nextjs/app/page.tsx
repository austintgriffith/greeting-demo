"use client";

import { useState } from "react";
import type { NextPage } from "next";
import { Address } from "@scaffold-ui/components";
import { useScaffoldReadContract } from "~~/hooks/scaffold-eth/useScaffoldReadContract";
import { useScaffoldWriteContract } from "~~/hooks/scaffold-eth/useScaffoldWriteContract";
import { useDeployedContractInfo } from "~~/hooks/scaffold-eth/useDeployedContractInfo";
import { useTargetNetwork } from "~~/hooks/scaffold-eth/useTargetNetwork";

const Home: NextPage = () => {
  const [newGreeting, setNewGreeting] = useState("");
  const { targetNetwork } = useTargetNetwork();

  const { data: currentGreeting } = useScaffoldReadContract({
    contractName: "Greeter",
    functionName: "greeting",
  });

  const { data: greeterContractData } = useDeployedContractInfo({ contractName: "Greeter" });

  const { writeContractAsync, isMining } = useScaffoldWriteContract({ contractName: "Greeter" });

  const handleSetGreeting = async () => {
    try {
      await writeContractAsync({
        functionName: "setGreeting",
        args: [newGreeting],
      });
      setNewGreeting("");
    } catch (e) {
      console.error("Error setting greeting:", e);
    }
  };

  return (
    <div className="flex items-center flex-col grow pt-10">
      <div className="px-5 w-full max-w-lg flex flex-col items-center">
        {/* Current greeting - visible to everyone, no wallet needed */}
        <div className="text-center mb-10">
          <p className="text-5xl font-bold leading-tight">
            {currentGreeting ?? "Loading..."}
          </p>
        </div>

        {/* Set greeting form */}
        <div className="w-full flex flex-col gap-4">
          <input
            type="text"
            placeholder="Enter new greeting"
            className="input input-bordered w-full"
            value={newGreeting}
            onChange={e => setNewGreeting(e.target.value)}
            disabled={isMining}
          />
          <button
            className="btn btn-primary w-full"
            disabled={isMining || !newGreeting.trim()}
            onClick={handleSetGreeting}
          >
            {isMining ? (
              <>
                <span className="loading loading-spinner loading-sm"></span>
                Setting...
              </>
            ) : (
              "Set Greeting"
            )}
          </button>
        </div>

        {/* Contract address */}
        <div className="text-center mt-12 text-sm opacity-70">
          <p>Contract:</p>
          <Address address={greeterContractData?.address} chain={targetNetwork} />
        </div>
      </div>
    </div>
  );
};

export default Home;
