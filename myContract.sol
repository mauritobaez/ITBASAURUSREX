// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;
contract DISU {
    uint256 patientCount = 0;
    mapping(uint256 => Patient) public patients;
    uint256 hospitalCount = 0;
    mapping(uint256 => Hospital) public hospitals;
    uint256 doctorsCount = 0;
    mapping(uint256 => Doctor) public doctors;
    uint256 farmacyCount = 0;
    mapping(uint256 => Farmacy) public farmacies;
    address owner;
    
    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    modifier isDoctor() {
        bool flag = false;
        for(uint256 id = 0; id < doctorsCount && !flag; ++id) {
            flag = (doctors[id].doctorWallet == msg.sender);
        }
        require(flag, "Caller is not Doctor");
        _;
    
    }

    modifier isHospitalOrOwner() {
        bool flag = (msg.sender == owner);
        for(uint256 id = 0; id < hospitalCount && !flag; ++id) {
            flag = (hospitals[id].hospitalWallet == msg.sender);
        }
        require(flag, "Caller is not Hospital or Owner");
        _;
    }

    modifier isFarmacy() {
        bool flag = false;
        for(uint256 id = 0; id < farmacyCount && !flag; ++id) {
            flag = (farmacies[id].farmacyWallet == msg.sender);
        }
        require(flag, "Caller is not Farmacy");
        _;
    }
   
    constructor() {
        owner = msg.sender;
    }

    struct Hospital {
        uint256 id;
        address hospitalWallet;
    } 
    
    struct Farmacy {
        uint256 id;
        address farmacyWallet;
    }

    struct Prescription {
        uint256 id;
        string str;
        bool active;
    }

    struct Doctor {
        uint256 id;
        uint256 matricula;
        address doctorWallet;
    }


    mapping(address => Prescription[]) public prescriptionsClient;
    mapping(address => string[]) public medicalHistory;

    struct Patient  {
        uint256 id;
        address patientWallet;
        uint256 prescriptionCount;
        uint256 medicalHistoryCount;
    }

    function addHospital(address wallet) public isOwner {
        hospitals[hospitalCount++] = Hospital({
            id: hospitalCount,
            hospitalWallet: wallet
        });
    }

    function addPatient(address patientWallet) public isHospitalOrOwner {
        patients[patientCount++] = Patient({
            id: patientCount, 
            patientWallet: patientWallet,
            prescriptionCount: 0,
            medicalHistoryCount: 0
        });
    }

    function addDoctor(address wallet, uint256 matricula) public isHospitalOrOwner {
        doctors[doctorsCount++] = Doctor({
           id: doctorsCount,
           matricula: matricula,
           doctorWallet: wallet
           
        });
    }

    function addFarmacy(address wallet) public isHospitalOrOwner {
        farmacies[farmacyCount++] = Farmacy({
           id: farmacyCount,
           farmacyWallet: wallet
        });
    }

    function findPatient(address patientWallet) private view returns(uint256) {
        for(uint256 id = 0; id < patientCount; id++) {
            if(patients[id].patientWallet == patientWallet) {
                return id;
            }
        }
        revert("Patient does not exist");
    }

    function newPrescription(address _patientWallet, string memory _str) public isDoctor {
        uint256 id = findPatient(_patientWallet);
        prescriptionsClient[_patientWallet].push(Prescription({
            id: patients[id].prescriptionCount++,
            str: _str,
            active: true
        }));

    }

    function consumePrescription(address _patientWallet, uint256 prescriptionCount, uint256 _prescriptionId) public isFarmacy returns(bool) {
        Prescription[] storage aux = prescriptionsClient[_patientWallet];
        for(uint256 i = 0; i < prescriptionCount; i++) {
            if(aux[i].id == _prescriptionId) {
                aux[i].active = false;
                return true;
            }
        }
        return false;
    }

    // recibe la data ya encriptada mediante la publicKey del paciente en cuestion
    function updateMedicalHistory(address patientWallet, string memory data) public isDoctor {
        uint256 id = findPatient(patientWallet);
        patients[id].medicalHistoryCount++;
        medicalHistory[patientWallet].push(data);
    }
}
