import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry.dart';
import 'package:aic_planner/shared/model/facility_model.dart';

class FacilityRegistry {
  static const kBeamTower = FacilityDefinition(
    id: 'kBeamTower',
    row: 2,
    col: 2,
    name: 'Beam Tower',
    power: 20,
    tier: 'Basic III',
    skill: 'Point Defense',
    description:
        'Consumes vast amounts of energy to emit a beam that deals massive Electric DMG to enemies.',
    facilityType: FacilityType.combat,
    baseImgPath: null,
    topDownImgPath: null,

    atk: 22338,
    atkInterval: '8s',
    energyPerUse: '160/min',
    maxCharge: 2000,
  );

  static const kGrenadeTower = FacilityDefinition(
    id: 'kGrenadeTower',
    row: 2,
    col: 2,
    name: 'Grenade Tower',
    power: 10,
    tier: 'Basic II',
    skill: 'Area Denial I',
    description:
        'Launches grenades in a ballistic trajectory. The grenades detonate above ground near enemies and deal area of effect Heat DMG.',
    facilityType: FacilityType.combat,

    atk: 981,
    atkInterval: '3s',
    energyPerUse: '30/min',
    maxCharge: 2000,
  );

  static const kGunTower = FacilityDefinition(
    id: 'kGunTower',
    row: 2,
    col: 2,
    name: 'Gun Tower',
    power: 5,
    tier: 'Basic II',
    skill: 'Defense I',
    description: 'Continuously fires energy bolts that deal Physical DMG.',
    facilityType: FacilityType.combat,
    baseImgPath: null,
    topDownImgPath: null,

    atk: 609,
    atkInterval: '2s',
    energyPerUse: '10/min',
    maxCharge: 2000,
  );

  static const kHeGrenadeTower = FacilityDefinition(
    id: 'kHeGrenadeTower',
    row: 2,
    col: 2,
    name: 'He Grenade Tower',
    power: 20,
    tier: 'Wuling I',
    skill: 'HE Grenade Tower',
    description:
        'Attacks enemies by launching Mk II grenades along a ballistic trajectory that detonate above ground near enemies. The grenade explosion deals area of effect Heat DMG and leaves a burning zone that deals DMG to enemies within it.',
    facilityType: FacilityType.combat,
    baseImgPath: null,
    topDownImgPath: null,

    atk: 5585,
    atkInterval: '3s',
  );

  static const kHeavyGunTower = FacilityDefinition(
    id: 'kHeavyGunTower',
    row: 2,
    col: 2,
    name: 'Heavy Gun Tower',
    power: 20,
    tier: 'Basic III',
    skill: 'Custom Defense I',
    description:
        'Continuously fires Mk II energy bolts with every 4th shot being an empowered bolt. The bolts deal Physical DMG.',
    facilityType: FacilityType.combat,
    baseImgPath: null,
    topDownImgPath: null,

    atk: 2136,
    atkInterval: '2s',
    energyPerUse: '40/min',
    maxCharge: 2000,
  );

  static const kLnTower = FacilityDefinition(
    id: 'kLnTower',
    row: 2,
    col: 2,
    name: 'LN Tower',
    power: 10,
    tier: 'Basic II',
    skill: 'Hostile Control I',
    description:
        'Fires special liquid nitrogen (LN) crystals that shatter upon impact to slow the movement speed of enemies in the area of effect.',
    facilityType: FacilityType.combat,
    baseImgPath: null,
    topDownImgPath: null,

    atkInterval: '5s',
    energyPerUse: '50/min',
    maxCharge: 2000,
  );

  static const kMarshGasMkITower = FacilityDefinition(
    id: 'kMarshGasMkITower',
    row: 2,
    col: 2,
    name: 'Marsh Gas Mk I Tower',
    power: 20,
    tier: 'Wuling I',
    skill: 'Marsh Gas Mk I',
    description:
        'Launches special mist grenades that detonate above ground near enemies. The mist grenade explosion deals area of effect Nature DMG and leaves a mist zone that deals DMG and slows the movement speed of enemies within it.',
    facilityType: FacilityType.combat,
    baseImgPath: null,
    topDownImgPath: null,

    atk: 5485,
    atkInterval: '5s',
  );

  static const kMedicalTower = FacilityDefinition(
    id: 'kMedicalTower',
    row: 3,
    col: 3,
    name: 'Medical Tower',
    power: 5,
    tier: 'Basic II',
    skill: 'Wilderness Aid',
    description:
        'Converts electrical power into healinga arts that can treat injured operators nearby.',
    facilityType: FacilityType.combat,
    baseImgPath: null,
    topDownImgPath: null,

    atkInterval: '5s',
    energyPerUse: '6000/min',
    maxCharge: 30000,
  );

  static const kOmnidirectionalSonicTower = FacilityDefinition(
    id: 'kOmnidirectionalSonicTower',
    row: 2,
    col: 2,
    name: 'Omnidirectional Sonic Tower',
    power: 20,
    tier: 'Basic III',
    skill: 'Hostile Control II',
    description:
        'Fires a shockwave that stuns common and advanced enemies within the area of effects.',
    facilityType: FacilityType.combat,
    baseImgPath: null,
    topDownImgPath: null,

    atkInterval: '5s',
    energyPerUse: '100/min',
    maxCharge: 2000,
  );

  static const kSentryTower = FacilityDefinition(
    id: 'kSentryTower',
    row: 2,
    col: 2,
    name: 'Sentry Tower',
    power: 20,
    tier: 'Basic III',
    skill: 'Custom Defense II',
    description:
        'Unleashes long-range attacks that target high-threat enemies first and deal massive Physical DMG.',
    facilityType: FacilityType.combat,
    baseImgPath: null,
    topDownImgPath: null,

    atk: 11634,
    atkInterval: '5s',
    energyPerUse: '100/min',
    maxCharge: 2000,
  );

  static const kSurgeTower = FacilityDefinition(
    id: 'kSurgeTower',
    row: 2,
    col: 2,
    name: 'Surge Tower',
    power: 20,
    tier: 'Basic III',
    skill: 'Area Denial II',
    description:
        'Releases electrical arcs that attack enemies. The arc also chains to nearby enemies (up to 2) and deals Electro DMG.',
    facilityType: FacilityType.combat,
    baseImgPath: null,
    topDownImgPath: null,

    atk: 4886,
    atkInterval: '3s',
    energyPerUse: '60/min',
    maxCharge: 2000,
  );

  static const kEasyStash = FacilityDefinition(
    id: 'kEasyStash',
    row: 3,
    col: 3,
    name: 'Easy Stash',
    power: 5,
    tier: 'Basic II',
    skill: 'Protocol Transfer Technology',
    description:
        'Provides direct access to the local Depot even when outside in the wilderness. Must be connected to power though, so you will need to use it near a Pylon or Relay Tower.',
    facilityType: FacilityType.exploration,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kMemoBeacon = FacilityDefinition(
    id: 'kMemoBeacon',
    row: 1,
    col: 1,
    name: 'Memo Beacon',
    power: 0,
    tier: 'Basic II',
    skill: 'Memo Becon Technology',
    description:
        'A facility used to post and leave beacon memos for other players to see. It may include icons or special messages that you want other players to see when they chance your beacon in their world.',
    facilityType: FacilityType.exploration,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kProtocolStash = FacilityDefinition(
    id: 'kProtocolStash',
    row: 3,
    col: 3,
    name: 'Protocol Stash',
    power: 5,
    tier: 'Basic II',
    skill: 'Field Stash',
    description:
        'A facility used to post and leave beacon memos for other players to see. It may include icons or special messages that you want other players to see when they chance your beacon in their world.',
    facilityType: FacilityType.exploration,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kZiplinePylon = FacilityDefinition(
    id: 'kZiplinePylon',
    row: 3,
    col: 3,
    name: 'Zipline Pylon',
    power: 5,
    tier: 'Basic II',
    skill: 'Field Mobility I',
    description:
        'Set up zipline routes with Zipline Pylons to quickly zip from one Pylon to another. Zipline distances can cover ~80m.',
    facilityType: FacilityType.exploration,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kZiplineTower = FacilityDefinition(
    id: 'kZiplineTower',
    row: 3,
    col: 3,
    name: 'Zipline Tower',
    power: 5,
    tier: 'Basic III',
    skill: 'Field Mobility II',
    description:
        'Set up zipline routes with Zipline Tower to quickly zip from one Tower to another. Zipline distances can cover ~110m.',
    facilityType: FacilityType.exploration,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kBeltBridge = FacilityDefinition(
    id: 'kBeltBridge',
    row: 1,
    col: 1,
    name: 'Belt Bridge',
    power: 0,
    tier: 'Basic II',
    skill: 'Belt Bridging',
    description:
        'Allows a transport belt to go over another without disrupting the flow of items on both belts.',
    facilityType: FacilityType.logistics,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kConverger = FacilityDefinition(
    id: 'kConverger',
    row: 1,
    col: 1,
    name: 'Converger',
    power: 0,
    tier: 'Basic III',
    skill: 'Belt Converging',
    description:
        'Converge product flows of 3 transport belts into a single belt.',
    facilityType: FacilityType.logistics,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kConveyorBelts = FacilityDefinition(
    id: 'kConveyorBelts',
    row: 1,
    col: 1,
    name: 'Conveyor Belts',
    power: 0,
    tier: 'Basic I',
    description:
        'A basic logistics structure used to continuously transport items between facilities. Provides reliable, automated item movement without processing or modification.',
    facilityType: FacilityType.logistics,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kFluidTank = FacilityDefinition(
    id: 'kFluidTank',
    row: 3,
    col: 3,
    name: 'Fluid Tank',
    power: 0,
    tier: 'Wuling I',
    skill: 'Fluid Storage',
    description: 'Stores a single type of fluid delivered to it via pipelines.',
    facilityType: FacilityType.logistics,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kItemControlPort = FacilityDefinition(
    id: 'kItemControlPort',
    row: 1,
    col: 1,
    name: 'Item Control Port',
    power: 0,
    tier: 'Basic II',
    skill: 'Item Control Port',
    description:
        'Limits the type and quantity of items allowed to pass through transport belts. Used in blueprints to mark the type of items to be moved into various transport belt sections.',
    facilityType: FacilityType.logistics,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kPipeBridge = FacilityDefinition(
    id: 'kPipeBridge',
    row: 1,
    col: 1,
    name: 'Pipe Bridge',
    power: 0,
    tier: 'Wuling I',
    skill: 'Pipe Fittings',
    description:
        'Allows a pipeline to go over another without disrupting the flow of fluids in both pipelines.',
    facilityType: FacilityType.logistics,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kPipeControlPort = FacilityDefinition(
    id: 'kPipeControlPort',
    row: 1,
    col: 1,
    name: 'Pipe Control Port',
    power: 0,
    tier: 'Wuling I',
    skill: 'Pipe Control Port',
    description:
        'Limits the fluid and the quantity of fluids allowed to pass through pipelines. Used in bluprints to mark the type of fluid to be moved through various pipelines.',
    facilityType: FacilityType.logistics,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kPipeConverger = FacilityDefinition(
    id: 'kPipeConverger',
    row: 1,
    col: 1,
    name: 'Pipe Converger',
    power: 0,
    tier: 'Wuling I',
    skill: 'Pipe Fittings',
    description: 'Converges up to 3 pipelines into a single pipeline.',
    facilityType: FacilityType.logistics,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kPipeSplitter = FacilityDefinition(
    id: 'kPipeSplitter',
    row: 1,
    col: 1,
    name: 'Pipe Splitter',
    power: 0,
    tier: 'Wuling I',
    skill: 'Pipe Fittings',
    description:
        'Splits 1 pipeline into 2 or 3 pipelines to divide fluid flow.',
    facilityType: FacilityType.logistics,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kSplitter = FacilityDefinition(
    id: 'kSplitter',
    row: 1,
    col: 1,
    name: 'Splitter',
    power: 0,
    tier: 'Basic II',
    skill: 'Belt Splitting',
    description:
        'Splits the product flow of 1 transport belt to up to 3 transport belts.',
    facilityType: FacilityType.logistics,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kSprinkler = FacilityDefinition(
    id: 'kSprinkler',
    row: 3,
    col: 3,
    name: 'Sprinkler',
    power: 10,
    tier: 'Wuling I',
    skill: 'Fluid Sprinkler',
    description:
        'Connects to a water source to automatically sprinkle water on a target.',
    facilityType: FacilityType.logistics,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kDepotLoader = FacilityDefinition(
    id: 'kDepotLoader',
    row: 1,
    col: 3,
    name: 'Depot Loader',
    power: 0,
    tier: 'Basic II',
    skill: 'Depot Bus',
    description:
        'Loading point attached to the Depot Bus that acts like an intake for items for Depot Storage. Can only be attached to a Depot Bus.',
    facilityType: FacilityType.power,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kDepotUnloader = FacilityDefinition(
    id: 'kDepotUnloader',
    row: 1,
    col: 3,
    name: 'Depot Unloader',
    power: 0,
    tier: 'Basic II',
    skill: 'Depot Bus',
    description:
        'Unloading point attached to the Depot Bus that acts like a source for items from the Depot Storage. Can only be attached to a Depot Bus.',
    facilityType: FacilityType.power,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kElectricPylon = FacilityDefinition(
    id: 'kElectricPylon',
    row: 2,
    col: 2,
    name: 'Electric Pylon',
    power: 0,
    tier: 'Basic II',
    skill: 'Electricity I',
    description: 'Error: Not Yet Added Ask Admin.',
    facilityType: FacilityType.power,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kRelayTower = FacilityDefinition(
    id: 'kRelayTower',
    row: 3,
    col: 3,
    name: 'Relay Tower',
    power: 0,
    tier: 'Basic II',
    skill: 'Power Relay',
    description: 'Error: Not Yet Added Ask Admin.',
    facilityType: FacilityType.power,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kThermalBank = FacilityDefinition(
    id: 'kThermalBank',
    row: 2,
    col: 2,
    name: 'Thermal Bank',
    power: 0,
    tier: 'Basic II',
    skill: 'Power I',
    description:
        'A facility that accepts batteries or Originium Ores as fuel to convert into electrical power. Must be connected to the power grid to work. The generated power is based on the fuel used.',
    facilityType: FacilityType.power,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kAutomationCore = FacilityDefinition(
    id: 'kAutomationCore',
    row: 9,
    col: 9,
    name: 'Automation Core',
    power: 0,
    tier: 'null',
    skill: 'null',
    description: 'Error: Not Yet Added Ask Admin.',
    facilityType: FacilityType.hero,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kDepotBusSection = FacilityDefinition(
    id: 'kDepotBusSection',
    row: 8,
    col: 4,
    name: 'Depot Bus Section',
    power: 0,
    tier: 'Wuling I',
    skill: 'Wuling Depot Bus',
    description: 'Error: Not Yet Added Ask Admin.',
    facilityType: FacilityType.xiranite,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kDepotBusPort = FacilityDefinition(
    id: 'kDepotBusPort',
    row: 4,
    col: 4,
    name: 'Depot Bus Port',
    power: 0,
    tier: 'Wuling I',
    skill: 'Wuling Depot Bus',
    description: 'Error: Not Yet Added Ask Admin.',
    facilityType: FacilityType.xiranite,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kForgeOfTheSky = FacilityDefinition(
    id: 'kForgeOfTheSky',
    row: 5,
    col: 5,
    name: 'Forge of the Sky',
    power: 50,
    tier: 'Wuling I',
    skill: 'Xiranite Forging',
    description: 'A facility for making Xiranite-based products.',
    facilityType: FacilityType.xiranite,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kXiranitePylon = FacilityDefinition(
    id: 'kXiranitePylon',
    row: 2,
    col: 2,
    name: 'Xiranite Pylon',
    power: 0,
    tier: 'Wuling I',
    skill: 'Wuling Power',
    description: 'Error: Not Yet Added Ask Admin.',
    facilityType: FacilityType.xiranite,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kXiraniteRelay = FacilityDefinition(
    id: 'kXiraniteRelay',
    row: 3,
    col: 3,
    name: 'Xiranite Relay',
    power: 0,
    tier: 'Wuling I',
    skill: 'Wuling Power',
    description: 'Error: Not Yet Added Ask Admin.',
    facilityType: FacilityType.xiranite,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kPortableOriginiumRig = FacilityDefinition(
    id: 'kPortableOriginiumRig',
    row: 3,
    col: 3,
    name: 'Portable Originium Rig',
    power: 0,
    tier: 'Basic I',
    skill: 'Mining I',
    description:
        'Mining rig for digging up Originium Ore. Does not require power.',
    facilityType: FacilityType.resourcing,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kElectricMiningRig = FacilityDefinition(
    id: 'kElectricMiningRig',
    row: 3,
    col: 3,
    name: 'Electric Mining Rig',
    power: 5,
    tier: 'Basic II',
    skill: 'Mining II',
    description:
        'Mining rig for digging up Originium and Amethyst Ore. Requires 5 Power and automatically transfers ores to the Depot at set intervals.',
    facilityType: FacilityType.resourcing,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kElectricMiningRigMkII = FacilityDefinition(
    id: 'kElectricMiningRigMkII',
    row: 3,
    col: 3,
    name: 'Electric Mining Rig Mk II',
    power: 10,
    tier: 'Basic III',
    skill: 'Mining III',
    description:
        'Mining rig for digging up Ferrium Ore and other minerals. Requires 10 Power and automatically transfers ores to the Depot at set intervals.',
    facilityType: FacilityType.resourcing,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kFluidPump = FacilityDefinition(
    id: 'kFluidPump',
    row: 3,
    col: 3,
    name: 'Fluid Pump',
    power: 10,
    tier: 'Wuling I',
    skill: 'Fluid Pumping',
    description: 'A facility for pumping fluids. Requires 10 Power to work.',
    facilityType: FacilityType.resourcing,
    baseImgPath: null,
    topDownImgPath: null,
  );

  static const kRefiningUnit = FacilityDefinition(
    id: 'kRefiningUnit',
    row: 3,
    col: 3,
    name: 'Refining Unit',
    power: 5,
    tier: 'Basic I',
    node: 'Refine I',
    description: 'Performs high temperature refining of various materials.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
    recipes: RefiningUnitRecipesRegistry.kRefiningUnitRecipes,
  );

  static const kShreddingUnit = FacilityDefinition(
    id: 'kShreddingUnit',
    row: 3,
    col: 3,
    name: 'Shredding Unit',
    power: 5,
    tier: 'Basic I',
    node: 'Shredding I',
    description: 'Heavy facility that shreds and pulverizes various materials.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
    recipes: RefiningUnitRecipesRegistry.kShreddingUnitRecipes,
  );

  static const kGearingUnit = FacilityDefinition(
    id: 'kGearingUnit',
    row: 6,
    col: 4,
    name: 'Gearing Unit',
    power: 10,
    tier: 'Basic II',
    node: 'Gearing Tech',
    description:
        'A facility that laminates different materials together to create gear components. Important for Operator Gear component creation.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
    recipes: RefiningUnitRecipesRegistry.kGearingUnitRecipes,
  );

  static const kMouldingUnit = FacilityDefinition(
    id: 'kMouldingUnit',
    row: 3,
    col: 3,
    name: 'Moulding Unit',
    power: 10,
    tier: 'Basic II',
    node: 'Material Moulding',
    description:
        'A facility capable of producing various containers via stamp moulding. Bottles are usually produced here.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
    recipes: RefiningUnitRecipesRegistry.kMouldingUnitRecipes,
  );

  static const kFittingUnit = FacilityDefinition(
    id: 'kFittingUnit',
    row: 3,
    col: 3,
    name: 'Fitting Unit',
    power: 20,
    tier: 'Basic II',
    node: 'Parts Fitting',
    description:
        'A facility capable of processing various parts that can be fitted together.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
    recipes: RefiningUnitRecipesRegistry.kFittingUnitRecipes,
  );

  static const kFillingUnit = FacilityDefinition(
    id: 'kFillingUnit',
    row: 6,
    col: 4,
    name: 'Filling Unit',
    power: 20,
    tier: 'Basic II',
    node: 'Solid Filling',
    description:
        'Fills containers with various materials. Can also accept fluids.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
    recipes: RefiningUnitRecipesRegistry.kFillingUnitRecipes,
  );

  static const kPackagingUnit = FacilityDefinition(
    id: 'kPackagingUnit',
    row: 6,
    col: 4,
    name: 'Packaging Unit',
    power: 20,
    tier: 'Basic II',
    node: 'Packaging Tech',
    description:
        'A facility for packaging certain power components. Mostly used for batteries, but also for used for other items.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
    recipes: RefiningUnitRecipesRegistry.kPackagingUnitRecipes,
  );

  static const kSeedPickingUnit = FacilityDefinition(
    id: 'kSeedPickingUnit',
    row: 5,
    col: 5,
    name: 'Seed Picking Unit',
    power: 10,
    tier: 'Basic II',
    node: 'Planting',
    description:
        'A facility that extracts seeds from common crops. Can also be upgraded to have a pipe input for some plants and crops.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
    recipes: RefiningUnitRecipesRegistry.kSeedPickingUnitRecipes,
  );

  static const kPlantingUnit = FacilityDefinition(
    id: 'kPlantingUnit',
    row: 5,
    col: 5,
    name: 'Planting Unit',
    power: 20,
    tier: 'Basic II',
    node: 'Planting',
    description:
        'A cultivating silo for growing various common plants and crops. Can also be upgraded to have a pipe input for some plants and crops.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
    recipes: RefiningUnitRecipesRegistry.kPlantingUnitRecipes,
  );

  static const kGrindingUnit = FacilityDefinition(
    id: 'kGrindingUnit',
    row: 6,
    col: 4,
    name: 'Grinding Unit',
    power: 50,
    tier: 'Basic III',
    node: 'Grinding',
    description:
        'Performs fine grinding of powdered materials. Mostly processes shredded items and turn them into a finer material.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
    recipes: RefiningUnitRecipesRegistry.kGrindingUnitRecipes,
  );

  static const kReactorCrucible = FacilityDefinition(
    id: 'kReactorCrucible',
    row: 5,
    col: 5,
    name: 'Reactor Crucible',
    power: 50,
    tier: 'Wuling I',
    node: 'Liquid Reaction',
    description:
        'A facility for running solid or liquid-state chemical reactions.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
    recipes: RefiningUnitRecipesRegistry.kReactorCrucibleRecipes,
  );

  static const kSeparatingUnit = FacilityDefinition(
    id: 'kSeparatingUnit',
    row: 6,
    col: 4,
    name: 'Separating Unit',
    power: 50,
    tier: 'Wuling I',
    node: 'Separation Technique',
    description:
        'A facility for disassembling various items or extracting liquid from filled bottles.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
    recipes: RefiningUnitRecipesRegistry.kSeparatingUnitRecipes,
  );

  static const kFluidSupplyUnit = FacilityDefinition(
    id: 'kFluidSupplyUnit',
    row: 3,
    col: 3,
    name: 'Fluid Supply Unit',
    power: 10,
    tier: 'Wuling I',
    node: 'Fluid Supply',
    description:
        'Placed near a lake or other bodies of water to supply fluids into the target area. The fluid outlet must be above the water body.',
    facilityType: FacilityType.processing,
    baseImgPath: null,
    topDownImgPath: null,
  );
}
