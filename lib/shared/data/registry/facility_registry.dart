import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
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
    imagePath: null,

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
    imagePath: null,

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
    imagePath: null,

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
    imagePath: null,

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
    imagePath: null,

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
    imagePath: null,

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
    imagePath: null,

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
    imagePath: null,

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
    imagePath: null,

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
    imagePath: null,

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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
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
    imagePath: null,
  );
}
