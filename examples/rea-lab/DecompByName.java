// Finds a function by name and prints pseudo C from Ghidra's decompiler
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
