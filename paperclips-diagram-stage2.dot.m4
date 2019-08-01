// --------------------------------------------------
// Stage 2
// --------------------------------------------------

digraph {

    {
        // Repeated nodes
        s2_project35[label="Release the HypnoDrones", DARK(), PROJECT()]
        s2_project17[label="The Toth Sausage Conjecture\n(+1 trust)", CREAT(), PROJECT()]

        s2_25kops[label="25,000 ops", OPS(), TARGET()]
        s2_35kops[label="35,000 ops", OPS(), TARGET()]
        s2_40kops[label="40,000 ops", OPS(), TARGET()]
        s2_45kops[label="45,000 ops", OPS(), TARGET()]
    }

    THEORY_OF_MIND_CLUSTER(s2)

    {
        node[OPS(), TARGET()]
        "80,000 ops" ->
        "85,000 ops" ->
        "100,000 ops" ->
        "120,000 ops"
    }

    {
        node[CREAT(), TARGET()]
        "20,000 creat"
    }

    project18[label="Töth Tubule Enfolding\n(Begin building with paperclips)", CREAT(), PROJECT()]
    { s2_project17, s2_project35, s2_45kops } -> project18

    // "20,000 creat" -> s2_25k_creat

    {
        // Strategic Modeling and Yomi targets
        node[YOMI(), TARGET()]
        "36,000 yomi"
        "50,000 yomi"
    }

    // Power grid

    s2_ultimate_power[label="10,000,000\n MW-seconds", POWERGRID(), TARGET()]
    "30 solar farms"[POWERGRID(), TARGET()]

    project127[label="Power Grid ", POWERGRID(), PROJECT()]
    { project18, s2_40kops } -> project127

    project125[label="Momentum\n(All perf. increases\nwhile powered)", POWERGRID(), PROJECT()]
    { "20,000 creat", "30 solar farms" } -> project125

    // Drones

    project41[label="Nanoscale Wire Production\n(Tech to harvest matter into wire)", DRONE(), PROJECT()]
    { project127, s2_35kops } -> project41

    project43[label="Harvester Drones ", DRONE(), PROJECT()]
    { project41, s2_25kops } -> project43

    project44[label="Wire Drones ", DRONE(), PROJECT()]
    { project41, s2_25kops } -> project44

    {
        node[DRONE(), TARGET()]

        "200 drones" "500 drones" "5,000 drones" "50,000 drones"

        // { project43, project44 } ->
        // "200 drones" -> "500 drones" -> "5,000 drones" -> "50,000 drones"

    }

    project110[label="Drone flocking: collision avoidance\n(100x drone perf.)", DRONE(), PROJECT()]
    { "80,000 ops", "500 drones" } -> project110

    project111[label="Drone flocking: alignment\n(1,000x drone perf.)", DRONE(), PROJECT()]
    { "100,000 ops", "5,000 drones" } -> project111

    project112[label="Drone Flocking: Adversarial Cohesion\n(every drone doubles\n every other drone perf.)", DRONE(), PROJECT()]
    { "50,000 yomi", "50,000 drones" } -> project112

    project126[label="Swarm Computing ", DRONE(), PROJECT()]
    { "36,000 yomi", "200 drones" } -> project126

    // Factories

    project45[label="Clip Factories ", FACTORY(), PROJECT()]
    { project43, project44, s2_35kops } -> project45

    {
        node[FACTORY(), TARGET()]
        // project45 ->
        // "10 factories" -> "20 factories" -> "50 factories"
        "10 factories" "20 factories" "50 factories"
    }

    project100[label="Upgraded Factories\n(100x factory perf.)", FACTORY(), PROJECT()]
    { "80,000 ops", "10 factories" } -> project100

    project101[label="Hyperspeed Factories\n(1000x factory perf.)", FACTORY(), PROJECT()]
    { "85,000 ops", "20 factories" } -> project101

    project102[label="Self-correcting Supply Chain\n(Every factory increases\n every other factory)", FACTORY(), PROJECT()]
    { "50 factories" } -> project102

    // Space exploratoin

    harvest_earth[label="Harvest all\n matter on Earth", DARK(), TARGET()]
    project46[label="Space Exploration ", DARK(), PROJECT()]
    { "120,000 ops", s2_ultimate_power, harvest_earth} -> project46

    {
        // Clips targets
        node[CLIPS(), TARGET()]
        include(`paperclips-diagram-stage2-include.dot')
    }

    {/*
        // Problems
        node[style=filled, fillcolor=orange]
        entertain[label="Entertain the swarm\n(cost: 10,000 creat\n +10,000 more each time)"]
        rebalance[label="Rebalance the sware\n(cost: 5,00 yomi)"]

        node[shape=oval]
        // {project43,project44} ->
        "Swarm gets bored" -> entertain
        // {project43,project44} ->
        "Swarm imbalanced" -> rebalance
    */}

    { rank=source s2_project35 }
}
