// --------------------------------------------------
// Stage 3
// --------------------------------------------------

digraph {

    {
        // Repeated nodes
        s3_project46[label="Space Exploration ", DARK(), PROJECT()]
        s3_100k_ops[label="100,000 ops", OPS(), TARGET()]
    }

    {
        // Repeating targets: Theory of Mind and Auto-Tourney
        s3_90_trust[label="90 trust", OPS(), TARGET()]
        s3_25k_creat[label="25,000 creat", CREAT(), TARGET()]
        s3_50k_creat[label="50,000 creat", CREAT(), TARGET()]
        s3_all_strats[label="All strats unlocked", YOMI(), TARGET()]
        s3_project119[label="Theory of Mind\n(Double tournament\n cost and reward)", YOMI(), PROJECT()]
        s3_project118[label="AutoTourney ", YOMI(), PROJECT()]

        s3_25k_creat -> s3_50k_creat
        { s3_25k_creat, s3_all_strats } -> s3_project119
        { s3_50k_creat, s3_90_trust } -> s3_project118
    }

    {
        node[OPS(), TARGET()]

        s3_100k_ops ->
        "125,000 ops" ->
        "150,000 ops" ->
        "175,000 ops" ->
        "200,000 ops" ->
        "250,000 ops" ->
        "300,000 ops"
    }

    // Drones

    "2 drones"[DRONE(), TARGET()]
    project130[label="Reboot the Swarm ", DRONE(), PROJECT()]
    { s3_project46, s3_100k_ops, "2 drones" } -> project130

    // Creative

    project218[label="Limerick (cont.) ", CREAT(), PROJECT()]

    {
        node[CREAT(), TARGET()]

        s3_50k_creat ->
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
        node[YOMI(), TARGET()]
        "30,000 yomi"
        "45,000 yomi"

        threnody_yomi[label="20,000 yomi"]
        threnody_yomi2[label="prev. yomi\n +4,000"]

        high_trust_cost[label="Probe trust cost\n greater than\n available yomi"]
    }

    // Strategic Modeling and Yomi

    project128[label="Strategic Attachment\n (Gain bonus yomi\n for winning strats)", YOMI(), PROJECT()]
    { s3_project46, "175,000 creat", s3_all_strats, high_trust_cost } -> project128

    {
        node[CLIPS(), TARGET()]
        "50 nonillion clips"
    }

    {
        node[COMBAT(), TARGET()]
        hazard_lost_100[label="100 probes\n lost to hazards"]
        combat_lost_1[label="Any probes\n lost in combat"]
        combat_lost_10m[label="10 million\n probes lost\n to combat"]
        combat_lost_1 -> combat_lost_10m
    }

    // Combat

    project129[label="Elliptic Hull Polytopes ", COMBAT(), PROJECT()]
    { "125,000 ops", hazard_lost_100 } -> project129

    project131[label="Combat ", COMBAT(), PROJECT()]
    { "150,000 ops", combat_lost_1 } -> project131

    project120[label="The OODA Loop\n(Use probe speed\n for evasion)", COMBAT(), PROJECT()]
    { "175,000 ops", "45,000 yomi", project131, combat_lost_10m } -> project120

    project121[label="Name the battles\n(Begin gaining honor)", COMBAT(), PROJECT()]
    { "225,000 creat", combat_lost_10m } -> project121

    project132[label="Monument to the Driftwar Fallen\n(+50,000 honor)", COMBAT(), PROJECT()]
    { "250,000 ops", "125,000 creat",
        "50 nonillion clips", project121 } -> project132

    project133[label="Threnody for the Heroes of ...\n(+10,000 honor)", COMBAT(), PROJECT()]
    { threnody_creat, threnody_yomi, project121 } -> project133

    project133_repeat[label="Threnody for the Heroes of ...\n(+10,000 honor)", COMBAT(), PROJECT()]
    project133 -> {threnody_creat2, threnody_yomi2} -> project133_repeat
    project133_repeat -> project133 [constraint=false]

    project134[label="Glory\n(Gain more honor\n for consecutive victories)", COMBAT(), PROJECT()]
    { "200,000 ops", "30,000 yomi", project121 } -> project134

    universal_paperclips[label="Universal\nPaperclips", DARK(), TARGET()]

    project200[label="The Universe Next Door ", DARK(), PROJECT()]
    { "300,000 ops", universal_paperclips } -> project200

    project201[label="The Universe Within ", DARK(), PROJECT()]
    { "300,000 creat", universal_paperclips } -> project201

    { rank=source s3_project46 }
    { rank=sink project200 project201 }
}
