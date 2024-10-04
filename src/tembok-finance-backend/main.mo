import Prim "mo:base/Prim";
import Cycles "mo:base/ExperimentalCycles";

actor TembokFinance {
    // Mendapatkan saldo cycles
    public query func getBalance() : async Nat {
        return Cycles.balance();
    };

    // Menambahkan cycles (top-up)
    public func topUp(amount: Nat) : async () {
        let result = Cycles.add(amount);
        if (result == null) {
            Debug.print("Top-up berhasil");
        } else {
            Debug.print("Top-up gagal");
        };
    };

    // Transfer cycles ke canister lain
    public func transfer(to: Principal, amount: Nat) : async () {
        let transferResult = await Cycles.transfer(to, amount);
        switch (transferResult) {
            case (#ok): Debug.print("Transfer sukses!");
            case (#error): Debug.print("Transfer gagal.");
        };
    };
};
