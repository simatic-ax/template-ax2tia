NAMESPACE Simatic.Ax.DemoLibrary
    FUNCTION_BLOCK WrapperFB
        VAR_INPUT
            Enable : BOOL;
        END_VAR
        VAR_OUTPUT
            Counts : DINT;
        END_VAR
        VAR
           _inst : ExampleClass; 
           _cyclesCounted : INT;
        END_VAR

        _inst.RunCyclic();
        Counts := _inst.GetValue();
    END_FUNCTION_BLOCK
END_NAMESPACE
