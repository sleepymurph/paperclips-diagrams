// --------------------------------------------------
// Stage 3
// --------------------------------------------------

digraph {

    // default project shape
    node[shape=box, style=filled, fillcolor=grey80]

    {
        // Space exploratoin
        rank=source
        node[style=filled, fillcolor=grey20, fontcolor=grey80]
        space_flag[label="Space Exploration "]
    }

    {
        // Ops targets
        node[shape=oval, style="", fillcolor=""]
        s3_100k_ops[label="100,000 ops"]

        s3_100k_ops ->
        "125,000 ops" ->
        "150,000 ops" ->
        "175,000 ops" ->
        "200,000 ops" ->
        "250,000 ops" ->
        "300,000 ops"
    }

    {
        // Drone targets
        node[fillcolor=darkseagreen]
        project130[label="Reboot the Swarm "]

        node[shape=oval]
        { space_flag, s3_100k_ops, "2 drones" } -> project130
    }

    {
        // Repeating targets: Theory of Mind and Autotourney
        node[style=filled, fillcolor=mediumpurple]
        node[shape=oval]
        s3_tm_25k_creat[label="25,000 creat"]
        s3_tm_50k_creat[label="50,000 creat"]
        s3_tm_25k_creat -> s3_tm_50k_creat

        node[shape=box, style=filled, fillcolor=lightblue2]
        s3_project119[label="Theory of Mind\n(Double tournament\n cost and reward)"]
        s3_project118[label="AutoTourney "]

        node[shape=oval]
        s3_tm_all_strats[label="All strats unlocked"]
        { s3_tm_25k_creat, s3_tm_all_strats } -> s3_project119
        { s3_tm_50k_creat } -> s3_project118
    }

    {
        // Creativity targets
        node[style=filled, fillcolor=mediumpurple]
        project218[label="Limerick (cont.) "]

        node[shape=oval]

        s3_tm_50k_creat ->
        "125,000 creat" ->
        "175,000 creat" ->
        "225,000 creat" ->
        "300,000 creat" ->
        "1,000,000 creat"

        threnody_creat[label="50,000 creat"]
        threnody_creat2[label="prev. creat\n +10,000"]

        "1,000,000 creat" -> project218
    }

    {
        // Strategic Modeling and Yomi targets
        node[style=filled, fillcolor=lightblue2]
        project128[label="Strategic Attachment\n (Gain bonus yomi\n for winning strats)"]

        node[shape=oval]
        { space_flag, "175,000 creat", s3_tm_all_strats, "Probe trust cost\n greater than\n available yomi"} -> project128

        "30,000 yomi"
        "45,000 yomi"

        threnody_yomi[label="20,000 yomi"]
        threnody_yomi2[label="prev. yomi\n +4,000"]
    }

    {
        // Clips targets
        node[fillcolor=lightsteelblue]
        node[shape=oval]
        "50 nonillion clips"
    }

    {
        // Combat targets
        node[style=filled, fillcolor=grey20, fontcolor=grey80]

        project129[label="Elliptic Hull Polytopes "]

        project131[label="Combat "]
        project120[label="The OODA Loop\n(Use probe speed\n for evasion)"]

        project121[label="Name the battles\n(Begin gaining honor)"]
        project132[label="Monument to the Driftwar Fallen\n(+50,000 honor)"]
        project133[label="Threnody for the Heroes of ...\n(+10,000 honor)",]
        project133_repeat[label="Threnody for the Heroes of ...\n(+10,000 honor)",]
        project134[label="Glory\n(Gain more honor\n for consecutive victories)"]

        { rank=sink
        project200[label="The Universe Next Door "]
        project201[label="The Universe Within "]
        }

        node[shape=oval]
        hazard_lost_100[label="100 probes\n lost to hazards"]
        combat_lost_1[label="Any probes\n lost in combat"]
        combat_lost_10m[label="10 million\n probes lost\n to combat"]

        { "125,000 ops", hazard_lost_100 } -> project129

        combat_lost_1 -> combat_lost_10m
        { "150,000 ops", combat_lost_1 } -> project131
        { "175,000 ops", "45,000 yomi", project131, combat_lost_10m } -> project120
        { "225,000 creat", combat_lost_10m } -> project121

        { "250,000 ops", "125,000 creat",
            "50 nonillion clips", project121 } -> project132

        { threnody_creat, threnody_yomi, project121 } -> project133
        project133 -> {threnody_creat2, threnody_yomi2} ->
        project133_repeat
        project133_repeat -> project133 [constraint=false]

        universal_paperclips[label="Universal\nPaperclips"]

        { "200,000 ops", "30,000 yomi", project121 } -> project134
        { "300,000 ops", universal_paperclips } -> project200
        { "300,000 creat", universal_paperclips } -> project201
    }
}
