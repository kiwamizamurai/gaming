// 名前で関数を探し、Ghidraのデコンパイラで擬似Cを出力する
import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.listing.Function;

public class DecompByName extends GhidraScript {
    @Override
    public void run() throws Exception {
        DecompInterface d = new DecompInterface();
        d.openProgram(currentProgram);
        for (String name : getScriptArgs()) {
            for (Function f : getGlobalFunctions(name)) {
                println("== " + name + " @ " + f.getEntryPoint());
                println(d.decompileFunction(f, 120, monitor).getDecompiledFunction().getC());
            }
        }
    }
}
