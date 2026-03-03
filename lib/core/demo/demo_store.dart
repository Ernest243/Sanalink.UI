import 'dart:math';
import 'package:sanalink/models/patient_model.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/models/lab_order_model.dart';
import 'package:sanalink/models/prescription_model.dart';
import 'package:sanalink/models/pharmacy_dispense_model.dart';

/// [DemoStore] centralisant toutes les données de démonstration.
/// Il permet de simuler la persistance et les interactions entre les modules
/// (ex: une prescription faite par un médecin apparaît en pharmacie).
class DemoStore {
  static final DemoStore _instance = DemoStore._internal();
  static DemoStore get instance => _instance;

  DemoStore._internal() {
    _initializeData();
  }

  final List<PatientModel> patients = [];
  final List<EncounterModel> encounters = [];
  final List<LabOrderModel> labOrders = [];
  final List<PrescriptionModel> prescriptions = [];
  final List<PharmacyDispenseModel> dispenses = [];
  final List<String> medications = [];

  void _initializeData() {
    final random = Random();
    final now = DateTime.now();

    // 1. Génération des Médicaments (50+)
    medications.addAll([
      'Paracétamol 1g',
      'Amoxicilline 500mg',
      'Ibuprofène 400mg',
      'Spasfon Lyoc',
      'Artesunate 60mg',
      'Lumefantrine/Artemether',
      'Ciprofloxacine 500mg',
      'Metformine 850mg',
      'Amlodipine 5mg',
      'Salbutamol Inhalateur',
      'Oméprazole 20mg',
      'Diclofénac 50mg',
      'Tramadol 50mg',
      'Azithromycine 250mg',
      'Insuline Glargine',
      'Furosémide 40mg',
      'Ceftriaxone 1g',
      'Gentamicine 80mg',
      'Dexaméthasone 4mg',
      'Prednisone 5mg',
      'Atorvastatine 20mg',
      'Losartan 50mg',
      'Glibenclamide 5mg',
      'Ranitidine 150mg',
      'Métoclopramide 10mg',
      'Chlorphénamine 4mg',
      'Loratadine 10mg',
      'Cétirizine 10mg',
      'Vitamine C 500mg',
      'Complexe Vitaminique B',
      'Sels de Réhydratation Orale',
      'Zinc 20mg',
      'Albendazole 400mg',
      'Métronidazole 500mg',
      'Doxycycline 100mg',
      'Cotrimoxazole 480mg',
      'Acide Folique 5mg',
      'Sulfate de Fer 200mg',
      'Nystatine Suspension',
      'Clotrimazole Crème',
      'Bétadine Solution',
      'Alcool 70%',
      'Ether Médical',
      'Adrénaline 1mg/ml',
      'Atropine 0.25mg/ml',
      'Lidocaïne 2%',
      'Morphine 10mg/ml',
      'Diazépam 10mg/2ml',
      'Phénobarbital 100mg',
      'Oxytocine 10 UI',
      'Sulfate de Magnésium 50%',
      'Céphalexine 500mg',
    ]);

    // 2. Génération des Patients avec des profils variés
    final lastNames = [
      'Omar',
      'Kaba',
      'Diallo',
      'Traoré',
      'Camara',
      'Elie',
      'Bola',
      'Conte',
      'Bangoura',
      'Kourouma',
      'Sidibé',
      'Barry',
      'Keita',
      'Touré',
      'Fofana',
    ];
    final firstNamesM = [
      'Jean',
      'Moussa',
      'Abdoulaye',
      'Sekou',
      'Ibrahima',
      'Oumar',
      'Mohamed',
      'Alhassane',
      'Thierno',
      'Souleymane',
      'Amadou',
      'Lamine',
      'Bakary',
    ];
    final firstNamesF = [
      'Marie',
      'Fatoumata',
      'Aissatou',
      'Mariam',
      'Hadja',
      'Mabinty',
      'Kadiatou',
      'Aminata',
      'Binta',
      'Djenabou',
      'Sira',
      'Oumou',
      'Safiatou',
    ];

    for (int i = 1; i <= 25; i++) {
      final isMale = random.nextBool();
      final firstName = isMale
          ? firstNamesM[random.nextInt(firstNamesM.length)]
          : firstNamesF[random.nextInt(firstNamesF.length)];
      final lastName = lastNames[random.nextInt(lastNames.length)];
      final age = 1 + random.nextInt(80);
      final dob = now.subtract(Duration(days: age * 365 + random.nextInt(365)));

      final patient = PatientModel(
        id: i,
        firstName: firstName,
        lastName: lastName,
        fullName: '$firstName $lastName',
        dateOfBirth: dob,
        gender: isMale ? 'M' : 'F',
        phone:
            '620 ${random.nextInt(100)} ${random.nextInt(100)} ${random.nextInt(100)}',
        email:
            '${firstName.toLowerCase()}.${lastName.toLowerCase()}@example.com',
        facilityId: 1,
        createdAt: now.subtract(Duration(days: random.nextInt(365))),
      );
      patients.add(patient);

      // Création d'un historique clinique pour certains patients
      if (random.nextDouble() > 0.3) {
        final numPastEncounters = 1 + random.nextInt(3);
        for (int j = 0; j < numPastEncounters; j++) {
          final encounterDate = now.subtract(
            Duration(days: 30 * (j + 1) + random.nextInt(15)),
          );
          final encId = encounters.length + 1;
          encounters.add(
            EncounterModel(
              id: encId,
              encounterNumber: 'ENC-HIST-${encId.toString().padLeft(4, '0')}',
              patientId: patient.id,
              patientName: patient.fullName,
              doctorName: random.nextBool() ? 'Dr. Andy' : 'Dr. Elie',
              status: 'Closed',
              chiefComplaint: _getRandomComplaint(random),
              vitals:
                  'TA: ${110 + random.nextInt(30)}/${70 + random.nextInt(20)}, FC: ${65 + random.nextInt(25)}, Temp: ${36 + random.nextDouble() * 2}C',
              diagnosis: 'Observation clinique de routine',
              clinicalNotes: 'Patient stable, suivi recommandé.',
              createdAt: encounterDate,
              closedAt: encounterDate.add(const Duration(minutes: 45)),
            ),
          );
        }
      }
    }

    // 3. Encounters en cours (Triage / Salle d'attente)
    for (int i = 0; i < 5; i++) {
      final patient = patients[random.nextInt(patients.length)];
      final encId = encounters.length + 1;
      encounters.add(
        EncounterModel(
          id: encId,
          encounterNumber:
              'ENC-${now.year}-${encId.toString().padLeft(4, '0')}',
          patientId: patient.id,
          patientName: patient.fullName,
          doctorName: random.nextBool() ? 'Dr. Andy' : 'Dr. Elie',
          status: i < 2 ? 'Open' : 'InProgress',
          chiefComplaint: _getRandomComplaint(random),
          vitals: i < 2 ? null : 'TA: 125/80, FC: 78, Temp: 37.5C',
          createdAt: now.subtract(Duration(minutes: 15 + random.nextInt(120))),
        ),
      );
    }

    // 4. Tests de laboratoire (Lab Orders)
    final labTests = [
      'NFS (Numération Formule Sanguine)',
      'Test Rapide Paludisme (TDR)',
      'Glycémie à jeun',
      'Widal',
      'ECBU',
      'Radiographie Thorax',
    ];
    for (int i = 1; i <= 10; i++) {
      final patient = patients[random.nextInt(patients.length)];
      final testName = labTests[random.nextInt(labTests.length)];
      final isCompleted = random.nextBool();
      labOrders.add(
        LabOrderModel(
          id: i,
          patientId: patient.id,
          requestedBy: 'Dr. Andy',
          testName: testName,
          status: isCompleted ? 'Completed' : 'Pending',
          result: isCompleted ? _getRandomLabResult(testName, random) : null,
          resultNotes: isCompleted ? 'Analysé par technicien de garde.' : null,
          createdAt: now.subtract(Duration(hours: 1 + random.nextInt(48))),
        ),
      );
    }

    // 5. Prescriptions (Pharmacy)
    for (int i = 1; i <= 15; i++) {
      final patient = patients[random.nextInt(patients.length)];
      final med = medications[random.nextInt(medications.length)];
      final isDispensed = random.nextDouble() > 0.4;
      final prescId = i;
      prescriptions.add(
        PrescriptionModel(
          id: prescId,
          patientId: patient.id,
          prescribedBy: 'Dr. Elie',
          medicationName: med,
          dosage: '1 comprimé 3 fois par jour pendant 5 jours',
          status: isDispensed ? 'Dispensed' : 'Pending',
          createdAt: now.subtract(Duration(hours: 2 + random.nextInt(24))),
        ),
      );

      if (isDispensed) {
        dispenses.add(
          PharmacyDispenseModel(
            id: dispenses.length + 1,
            prescriptionId: prescId,
            quantityDispensed: 15,
            status: 'Completed',
            dispensedAt: now.subtract(const Duration(hours: 1)),
          ),
        );
      }
    }
  }

  String _getRandomComplaint(Random r) {
    final complaints = [
      'Fièvre persistante',
      'Maux de tête intenses',
      'Toux sèche',
      'Douleurs abdominales',
      'Palpitations',
      'Fatigue générale',
      'Douleurs articulaires',
      'Éruption cutanée',
      'Suivi de grossesse',
      'Contrôle tensionnel',
      'Diarrhée et vomissements',
    ];
    return complaints[r.nextInt(complaints.length)];
  }

  String _getRandomLabResult(String testName, Random r) {
    if (testName.contains('Paludisme')) return 'Positif (++)';
    if (testName.contains('NFS')) return 'GB: 8.5 x10^9/L, Hb: 12.8 g/dL';
    if (testName.contains('Glycémie'))
      return '${0.8 + r.nextDouble() * 0.4} g/L';
    return 'Résultat normal';
  }

  // --- API pour les Mock Repositories ---

  Future<void> syncLabRequest(
    int patientId,
    String testName,
    String doctor,
  ) async {
    final newId = labOrders.isEmpty
        ? 1
        : labOrders.map((e) => e.id).reduce(max) + 1;
    labOrders.add(
      LabOrderModel(
        id: newId,
        patientId: patientId,
        requestedBy: doctor,
        testName: testName,
        status: 'Pending',
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<void> syncPrescription(
    int patientId,
    String med,
    String dosage,
    String doctor,
  ) async {
    final newId = prescriptions.isEmpty
        ? 1
        : prescriptions.map((e) => e.id).reduce(max) + 1;
    prescriptions.add(
      PrescriptionModel(
        id: newId,
        patientId: patientId,
        prescribedBy: doctor,
        medicationName: med,
        dosage: dosage,
        status: 'Pending',
        createdAt: DateTime.now(),
      ),
    );
  }
}
