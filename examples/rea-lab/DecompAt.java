// 指定アドレスに関数がなければ作り、Ghidraのデコンパイラで擬似Cを出力する
import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;

public class DecompAt extends GhidraScript {
    @Override
    public void run() throws Exception {
        Address a = toAddr(getScriptArgs()[0]);
        Function f = getFunctionAt(a);
        if (f == null) {
            disassemble(a);
            f = createFunction(a, null);
            println("created function at " + a + ": " + (f != null));
        }
        DecompInterface d = new DecompInterface();
        d.openProgram(currentProgram);
        DecompileResults r = d.decompileFunction(f, 60, monitor);
        println(r.getDecompiledFunction().getC());
    }
}
