# Código do Mermaid

stateDiagram-v2
    direction LR

    state "Milhares (M)" as Milhares {
        mq0: q0
        mq1: q1
        mq2: q2
        mq3: q3
        
        [*] --> mq0
        mq0 --> mq1 : M
        mq1 --> mq2 : M
        mq2 --> mq3 : M
        
        mq1 --> mq_s1 : ε
        mq2 --> mq_s2 : ε
        mq3 --> mq_s3 : ε
    }

    Milhares --> Centenas : ε

    state "Centenas (C, D, M)" as Centenas {
        cq0: q0
        cq1: q1
        cq2: q2
        cq3: q3
        
        [*] --> cq0
        cq0 --> cq5 : D
        cq5 --> cq6 : ε
        
        cq0 --> cq1 : C
        cq1 --> cq2 : C
        cq2 --> cq3 : C
        
        cq1 --> cq12 : ε
        cq2 --> cq13 : ε
        cq3 --> cq14 : ε
        
        cq1 --> cq4 : D
        cq4 --> cq7 : ε
        
        cq1 --> cq8 : M
        cq8 --> cq9 : ε
    }

    Centenas --> Dezenas : ε

    state "Dezenas (X, L, C)" as Dezenas {
        dq0: q0
        dq1: q1
        dq2: q2
        dq3: q3
        
        [*] --> dq0
        dq0 --> dq5 : L
        dq5 --> dq6 : ε
        
        dq0 --> dq1 : X
        dq1 --> dq2 : X
        dq2 --> dq3 : X
        
        dq1 --> dq12 : ε
        dq2 --> dq13 : ε
        dq3 --> dq14 : ε
        
        dq1 --> dq4 : L
        dq4 --> dq7 : ε
        
        dq1 --> dq8 : C
        dq8 --> dq9 : ε
    }

    Dezenas --> Unidades : ε

    state "Unidades (I, V, X)" as Unidades {
        uq0: q0
        uq1: q1
        uq2: q2
        uq3: q3
        
        [*] --> uq0
        uq0 --> uq5 : V
        uq5 --> uq6 : ε
        
        uq0 --> uq1 : I
        uq1 --> uq2 : I
        uq2 --> uq3 : I
        
        uq1 --> uq12 : ε
        uq2 --> uq13 : ε
        uq3 --> uq14 : ε
        
        uq1 --> uq4 : V
        uq4 --> uq7 : ε
        
        uq1 --> uq8 : X
        uq8 --> uq9 : ε
    }

    Unidades --> [*]
