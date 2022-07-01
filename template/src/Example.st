NAMESPACE Simatic.Ax.DemoLibrary
    CLASS ExampleClass
        VAR PUBLIC
            
        END_VAR
        VAR PROTECTED
            _value : DINT;
        END_VAR
        
        METHOD PUBLIC RunCyclic
            _value := _value + DINT#1;
        END_METHOD

        METHOD PUBLIC GetValue : DINT
            GetValue := _value;
        END_METHOD

    END_CLASS
END_NAMESPACE