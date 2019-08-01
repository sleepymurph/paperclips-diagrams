digraph {

    // --------------------------------------------------
    // Stage 1 - part 1 (up to 20,000 ops)
    // --------------------------------------------------

    {
        // Ops targets
        node[OPS(), TARGET()]

        "500 ops" ->
        "750 ops" ->
        "1000 ops" ->
        "1750 ops" ->
        "2500 ops" ->
        "3000 ops" ->
        "4500 ops" ->
        "5000 ops" ->
        "6000 ops" ->
        "7000 ops" ->
        "7500 ops" ->
        "8 trust" ->
        "10,000 ops" ->
        "12,000 ops" ->
        "14,000 ops" ->
        "15,000 ops" ->
        "17,000 ops" ->
        "17,500 ops" ->
        "19,500 ops" ->
        "20,000 ops"
    }

    {
        node[CREAT(), TARGET()]
        "10 creat" ->
        "50 creat" ->
        "100 creat" ->
        "150 creat" ->
        "200 creat" ->
        "250 creat" ->
        "500 creat"
    }

    {
        node[YOMI(), TARGET()]
        "3,000 yomi"
    }

    {
        node[WIRE(), TARGET()]
        "Buy wire 1x"
        "Buy wire 15x"
        "wire >= $125"
    }

    {
        node[RESET(), TARGET()]
        "Out of money\n and clips"
        "-10,000 ops"
    }

    // AutoClippers
    project1[label="Improved AutoClippers\n(+25% autoclip)", CLIPS(), PROJECT()]
    "750 ops" -> project1

    project4[label="Even Better AutoClippers\n(+50% autoclip)", CLIPS(), PROJECT()]
    "2500 ops" -> project4

    project5[label="Optimized AutoClippers\n(+70% autoclip)", CLIPS(), PROJECT()]
    "5000 ops" -> project5

    project16[label="Hadwiger Clip Diagrams\n(+500% autoclip)", CLIPS(), PROJECT()]


    // Creativity

    project3[label="Creativity", CREAT(), PROJECT()]
    "1000 ops" -> project3
    project3 -> "10 creat"

    project6[label="Limerick\n(+1 trust)", CREAT(), PROJECT()]
    "10 creat" -> project6

    project13[label="Lexical Processing\n(+1 trust)", CREAT(), PROJECT()]
    { "50 creat" } -> project13

    project14[label="Combinatory Harmonics\n(+1 trust)", CREAT(), PROJECT()]
    { "100 creat" } -> project14

    project11[label="New Slogan\n(+50% marketing)", CREAT(), PROJECT()]
    { "25 creat", "2500 ops", project13 } -> project11

    project12[label="Catchy Jingle\n(2x marketing)", CREAT(), PROJECT()]
    { "45 creat", "4500 ops", project14 } -> project12

    project15[label="The Hadwiger Problem\n(+1 trust)", CREAT(), PROJECT()]
    { "150 creat" } -> project15

    project17[label="The Toth Sausage Conjecture\n(+1 trust)", CREAT(), PROJECT()]
    { "200 creat" } -> project17

    project19[label="Donkey Space\n(+1 trust)", CREAT(), PROJECT()]
    { "250 creat" } -> project19

    { "6000 ops", project15 } -> project16


    // Money targets

    project21[label="Algorithmic Trading\n(enable investment)", MONEY(), PROJECT()]
    { "10,000 ops", "8 trust" } -> project21

    project42[label="RevTracker", MONEY(), PROJECT()]
    { "500 ops" } -> project42

    // Strategic Modeling and Yomi targets

    project20[label="Strategic Modeling\n(enable tournament/yomi)", YOMI(), PROJECT()]
    project20 -> "3,000 yomi"
    { "12,000 ops", project19 } -> project20

    project60[label="New Strategy: A100", YOMI(), PROJECT()]
    { "15,000 ops", project20 } -> project60

    project61[label="New Strategy: B100", YOMI(), PROJECT()]
    { "17,500 ops", project60 } -> project61

    project62[label="New Strategy: GREEDY", YOMI(), PROJECT()]
    { "20,000 ops", project61 } -> project62


    // Wire targets

    // Note that the "wireSupply" variable in the code represents the
    // supply from each spool, not your current wire count. Each project's
    // trigger threshold matches the value set by the project before it, so
    // effectively they depend on each other.

    project7[label="Improved Wire Extrusion\n(+50% wire)", WIRE(), PROJECT()]
    { "1750 ops", "Buy wire 1x" } -> project7

    project8[label="Optimized Wire Extrusion\n(+75% wire)", WIRE(), PROJECT()]
    { "3000 ops", project7 } -> project8

    project9[label="Microlattice Shapecasting\n(+100% wire)", WIRE(), PROJECT()]
    { "7500 ops", project8 } -> project9

    project10[label="Spectral Froth Annealment\n(+200% wire)", WIRE(), PROJECT()]
    { "12,000 ops", project9 } -> project10

    project10b[label="Quantum Foam Annealment\n(+1,000% wire)", WIRE(), PROJECT()]
    { "15,000 ops", "wire >= $125" } -> project10b

    project26[label="WireBuyer", WIRE(), PROJECT()]
    { "7000 ops", "Buy wire 15x" } -> project26

    // MegaClippers
    "75 AutoClippers"[CLIPS(), TARGET()]

    project22[label="MegaClippers", CLIPS(), PROJECT()]
    { "12,000 ops", "75 AutoClippers" } -> project22

    project23[label="Improved MegaClippers\n(+25% megaclip)", CLIPS(), PROJECT()]
    { "14,000 ops", project22 } -> project23

    project24[label="Even Better MegaClippers\n(+50% megaclip)", CLIPS(), PROJECT()]
    { "17,000 ops", project23 } -> project24

    project25[label="Optimized MegaClippers\n(+100% megaclip)", CLIPS(), PROJECT()]
    { "19,500 ops", project24 } -> project25

    // HypnoDrones

    project34[label="Hypno Harmonics\n(5x marketing, -1 trust)", DARK(), PROJECT()]
    { "7500 ops", project12 } -> project34

    // Creative Megaprojects

    // Megaprojects

    project27[label="Coherent Extrapolated Volition\n(+1 trust, a new era of trust)", MEGACREAT(), PROJECT()]
    { "500 creat", "3,000 yomi", "20,000 ops" } -> project27

    // Quantum Computing

    project50[label="Quantum Computing", QUANTUM(), PROJECT()]
    project51[label="Photonic Chip", QUANTUM(), PROJECT()]
    pchip2[label="Photonic Chip (`#'2)", QUANTUM(), PROJECT()]
    pchip3[label="Photonic Chip (`#'3)", QUANTUM(), PROJECT()]

    { "10,000 ops", "5 processors" } -> project50
    { "10,000 ops", project50 } -> project51
    { "15,000 ops", project51 } -> pchip2
    { "20,000 ops", pchip2 } -> pchip3

    // Resets
    project2[label="Beg for more wire\n(-1 trust)", RESET(), PROJECT()]
    project217[label="Quantum Temporal Reversion\n(reset game)", RESET(), PROJECT()]

    { "Out of money\n and clips" } -> project2
    { project51 } -> "-10,000 ops"
    { "-10,000 ops" } -> project217

    { rank=sink pchip3 project27 project62 }
}
