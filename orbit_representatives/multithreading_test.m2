needsPackage "RandomIdeals";

R = QQ[a,b,c];

T = {};

time for i from 1 to 30 do (T = append(T, randomMonomialIdeal({7, 7, 7}, R)));

current = 0;
currentThreads = 0;

-- list of current threads
L = {}; 

computeGB = I -> () -> gb I;

computeBetti = I -> () -> betti res I;

computeSleep = I -> () -> sleep 1;

customTask = (a, b) -> createTask(b(a));

time while current < #T do (

    -- Check running threads for any complete tasks
    completeIndices = {};

    for i from 0 to #L - 1  do(
        if isReady L#i then (
            completeIndices = append(completeIndices, i)
        );
    );

    completeIndices = reverse(completeIndices);

    for i in completeIndices do (
        L = drop(L, {i, i});
        currentThreads = currentThreads - 1;
    );

    
    -- If there is an open thread, check to see if a new task
    -- can be scheduled, and schedule it
    while currentThreads < maxAllowableThreads do (
        -- print(current);
        L = append(L, customTask(T#current, computeSleep));
        schedule L#currentThreads;
        currentThreads = currentThreads + 1;
        current = current + 1;
    );

    if current % 100 == 0 then (print current);
)

time for i from 0 to #T - 1 do (
    -- gb T#i;
    sleep 1;
);

-- time T/gb;

