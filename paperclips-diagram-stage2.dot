// --------------------------------------------------
// Stage 2
// --------------------------------------------------

digraph {

    // default project shape
    node[shape=box, style=filled, fillcolor=grey80]

    {
        // HypnoDrones
        rank=source
        node[style=filled, fillcolor=grey20, fontcolor=grey80]
        s2_project35[label="Release the HypnoDrones"]
    }
    {
        // Ops targets
        node[shape=oval, style="", fillcolor=""]
        s2_25kops[label="25,000 ops"]
        s2_35kops[label="35,000 ops"]
        s2_40kops[label="40,000 ops"]
        s2_45kops[label="45,000 ops"]

        "80,000 ops" ->
        "85,000 ops" ->
        "100,000 ops" ->
        "120,000 ops"
    }

    {
        // Creativity targets
        node[style=filled, fillcolor=mediumpurple]
        s2_project17[label="The Toth Sausage Conjecture\n(+1 trust)"]
        project18[label="Töth Tubule Enfolding\n(Begin building with paperclips)"]

        node[shape=oval]
        "20,000 creat"

        { s2_project17, s2_project35, s2_45kops } -> project18
    }

    {
        // Repeating targets: Theory of Mind and Autotourney
        node[style=filled, fillcolor=mediumpurple]
        node[shape=oval]
        s2_tm_25k_creat[label="25,000 creat"]
        s2_tm_50k_creat[label="50,000 creat"]
        s2_tm_25k_creat -> s2_tm_50k_creat

        node[shape=box, style=filled, fillcolor=lightblue2]
        s2_project119[label="Theory of Mind\n(Double tournament\n cost and reward)"]
        s2_project118[label="AutoTourney "]

        node[shape=oval]
        s2_tm_all_strats[label="All strats unlocked"]
        { s2_tm_25k_creat, s2_tm_all_strats } -> s2_project119
        { s2_tm_50k_creat } -> s2_project118
    }
    "20,000 creat" -> s2_tm_25k_creat

    {
        // Strategic Modeling and Yomi targets
        node[style=filled, fillcolor=lightblue2]

        node[shape=oval]
        "36,000 yomi"
        "50,000 yomi"
    }
    {
        // Power grid
        node[fillcolor=gold]
        project127[label="Power Grid "]
        project125[label="Momentum\n(All perf. increases\nwhile powered)"]

        node[shape=oval]
        s2_ultimate_power[label="10,000,000\n MW-seconds"]
        "30 solar farms"
        { project18, s2_40kops } -> project127
    }
    {
        // Drone targets
        node[fillcolor=darkseagreen]
        project41[label="Nanoscale Wire Production\n(Tech to harvest matter into wire)"]
        project43[label="Harvester Drones "]
        project44[label="Wire Drones "]

        project110[label="Drone flocking: collision avoidance\n(100x drone perf.)"]
        project111[label="Drone flocking: alignment\n(1,000x drone perf.)"]
        project112[label="Drone Flocking: Adversarial Cohesion\n(every drone doubles\n every other drone perf.)"]

        project126[label="Swarm Computing "]

        node[shape=oval]

        // { project43, project44 } ->
        // "200 drones" -> "500 drones" -> "5,000 drones" -> "50,000 drones"

        { project127, s2_35kops } -> project41
        { project41, s2_25kops } -> project43
        { project41, s2_25kops } -> project44
        { "80,000 ops", "500 drones" } -> project110
        { "100,000 ops", "5,000 drones" } -> project111
        { "50,000 yomi", "50,000 drones" } -> project112
        { "36,000 yomi", "200 drones" } -> project126
    }
    {
        // Factory targets
        project45[label="Clip Factories "]
        project100[label="Upgraded Factories\n(100x factory perf.)"]
        project101[label="Hyperspeed Factories\n(1000x factory perf.)"]
        project102[label="Self-correcting Supply Chain\n(Every factory increases\n every other factory)"]

        node[shape=oval]
        // project45 ->
        // "10 factories" -> "20 factories" -> "50 factories"

        { project43, project44, s2_35kops } -> project45
        { "80,000 ops", "10 factories" } -> project100
        { "85,000 ops", "20 factories" } -> project101
        { "50 factories" } -> project102
    }

    {
        // Space exploratoin
        node[style=filled, fillcolor=grey20, fontcolor=grey80]
        project46[label="Space Exploration "]

        node[shape=oval]
        { "120,000 ops", s2_ultimate_power, "Harvest all\n available matter" } -> project46
    }

    {
        // Creativity targets
        node[style=filled, fillcolor=mediumpurple]

        node[shape=oval]
        { "20,000 creat", "30 solar farms" } -> project125
    }
    {
        // Clips targets
        node[fillcolor=lightsteelblue]
        node[shape=oval]
        // python3 upc_prices.py

        "2 trillion clips" -> "200 drones"
        "10.8 trillion clips" -> "30 solar farms"
        "38.5 trillion clips" -> "500 drones"
        "2.2 quadrillion clips" -> "10 factories"
        "68 quadrillion clips" -> "5,000 drones"
        "705.7 quadrillion clips" -> "20 factories"
        "120.9 quintillion clips" -> "50,000 drones"
        "714.8 quintillion clips" -> "50 factories"
        "1 sextillion clips" -> project102
        "5 octillion clips" -> project46
        //
        project45 ->
        "2 trillion clips" ->
        "10.8 trillion clips" ->
        "38.5 trillion clips" ->
        "2.2 quadrillion clips" ->
        "68 quadrillion clips" ->
        "705.7 quadrillion clips" ->
        "120.9 quintillion clips" ->
        "714.8 quintillion clips" ->
        "1 sextillion clips" ->
        "5 octillion clips"

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
}
