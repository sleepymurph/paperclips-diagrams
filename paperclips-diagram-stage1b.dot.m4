// --------------------------------------------------
// Stage 1 - part 2 (after 20,000 ops)
// --------------------------------------------------

digraph {

    {
        // Repeated nodes
        s1b_project34[label="Hypno Harmonics\n(5x marketing, -1 trust)", DARK(), PROJECT()]
    }

    THEORY_OF_MIND_CLUSTER(s1)

    {
        // Ops targets
        node[OPS(), TARGET()]
        "20,000 ops" ->
        "22,500 ops" ->
        "25,000 ops" ->
        "30,000 ops" ->
        "32,500 ops" ->
        "35,000 ops" ->
        "40,000 ops" ->
        "45,000 ops" ->
        "50,000 ops" ->
        "55,000 ops" ->
        "70,000 ops" ->
        "85 trust" ->
        "90 trust" ->
        "100 trust"
    }
    "90 trust" -> s1_project119

    {
        "100,000 creat"[RESET(), TARGET()]

        node[CREAT(), TARGET()]
        s1_50k_creat ->
        "100,000 creat"
    }

    {
        node[CLIPS(), TARGET()]
        "101 million clips"
    }

    {
        node[YOMI(), TARGET()]
        "3,000 yomi" ->
        "4,500 yomi" ->
        "15,000 yomi"
    }

    {
        node[MONEY(), TARGET()]
        "$1 M" -> "$10 M"
        "$500,000" -> "2x previous\ngift $$"
    }

    // Strategic Modeling and Yomi targets

    project62[label="New Strategy: GREEDY", YOMI(), PROJECT()]

    project63[label="New Strategy: GENEROUS", YOMI(), PROJECT()]
    { "22,500 ops", project62 } -> project63

    project64[label="New Strategy: MINIMAX", YOMI(), PROJECT()]
    { "25,000 ops", project63 } -> project64

    project65[label="New Strategy: TIT FOR TAT", YOMI(), PROJECT()]
    { "30,000 ops", project64 } -> project65

    project66[label="New Strategy: BEAT LAST", YOMI(), PROJECT()]
    { "32,500 ops", project65 } -> project66
    // project66 -> s1_all_strats

    // Money targets

    project37[label="Hostile Takeover\n(+1 trust, 5x demand)", MONEY(), PROJECT()]
    { "$1 M" } -> project37

    project38[label="Full Monopoly\n(+1 trust, 10x demand)", MONEY(), PROJECT()]
    { "$10 M", "3,000 yomi", project37 } -> project38

    project40[label="A Token of Goodwill...\n(+1 trust)", MONEY(), PROJECT()]
    { "$500,000", "85 trust", "101 million clips" } -> project40

    project40b[label="Another Token of Goodwill...\n(+1 trust)", MONEY(), PROJECT()]
    { "2x previous\ngift $$", project40 } -> project40b

    project40b -> "100 trust"

    // HypnoDrones

    project35[label="Release the HypnoDrones", DARK(), PROJECT()]
    { "100 trust", project70 } -> project35

    project70[label="HypnoDrones", DARK(), PROJECT()]
    { "70,000 ops", s1b_project34 } -> project70

    // Megaprojects

    project27[label="Coherent Extrapolated Volition\n(+1 trust, a new era of trust)", MEGACREAT(), PROJECT()]

    project28[label="Cure for Cancer\n(+10 trust, +.01 stock gain)", MEGACREAT(), PROJECT()]
    { "25,000 ops", project27 } -> project28

    project29[label="World Peace\n(+12 trust, +.01 stock gain)", MEGACREAT(), PROJECT()]
    { "30,000 ops", "15,000 yomi", project27 } -> project29

    project30[label="Global Warming\n(+12 trust, +.01 stock gain)", MEGACREAT(), PROJECT()]
    { "50,000 ops", "4,500 yomi", project27 } -> project30

    project31[label="Male Pattern Baldness\n(+20 trust, +.01 stock gain)", MEGACREAT(), PROJECT()]
    { "20,000 ops", project27 } -> project31


    // Quantum Computing

    pchip3[label="Photonic Chip (`#'3)", QUANTUM(), PROJECT()]
    pchip4[label="Photonic Chip (`#'4)", QUANTUM(), PROJECT()]
    pchip5[label="Photonic Chip (`#'5)", QUANTUM(), PROJECT()]
    pchip6[label="Photonic Chip (`#'6)", QUANTUM(), PROJECT()]
    pchip7[label="Photonic Chip (`#'7)", QUANTUM(), PROJECT()]
    pchip8[label="Photonic Chip (`#'8)", QUANTUM(), PROJECT()]
    pchip9[label="Photonic Chip (`#'9)", QUANTUM(), PROJECT()]
    pchip10[label="Photonic Chip (`#'10)", QUANTUM(), PROJECT()]

    { "25,000 ops", pchip3 } -> pchip4
    { "30,000 ops", pchip4 } -> pchip5
    { "35,000 ops", pchip5 } -> pchip6
    { "40,000 ops", pchip6 } -> pchip7
    { "45,000 ops", pchip7 } -> pchip8
    { "50,000 ops", pchip8 } -> pchip9
    { "55,000 ops", pchip9 } -> pchip10

    // Resets

    project219[label="Xavier Re-initialization\n(re-allocate trust)", rank=sink, RESET(), PROJECT()]
    { "100,000 creat" } -> project219

    { rank=source pchip3 project27 project62 }
    { rank=sink project35 }
}

