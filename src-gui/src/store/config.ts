import { ExtendedMakerStatus } from "models/apiModel";
import { splitPeerIdFromMultiAddress } from "utils/parseUtils";
import { getMatches } from "@tauri-apps/plugin-cli";
import { Network } from "./features/settingsSlice";

const matches = await getMatches();

export function getNetwork(): Network {
  if (isTestnet()) {
    return Network.Testnet;
  } else {
    return Network.Mainnet;
  }
}

export function isTestnet() {
  return matches.args.testnet?.value === true;
}

export const isDevelopment = true;

export function getStubTestnetMaker(): ExtendedMakerStatus | null {
  const stubMakerAddress = import.meta.env.VITE_TESTNET_STUB_PROVIDER_ADDRESS;

  if (stubMakerAddress != null) {
    try {
      const [multiAddr, peerId] = splitPeerIdFromMultiAddress(stubMakerAddress);

      return {
        multiAddr,
        testnet: true,
        peerId,
        maxSwapAmount: 0,
        minSwapAmount: 0,
        price: 0,
      };
    } catch {
      return null;
    }
  }

  return null;
}

export function getNetworkName(): string {
  if (isTestnet()) {
    return "Testnet";
  } else {
    return "Mainnet";
  }
}
