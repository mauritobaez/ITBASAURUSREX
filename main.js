const CryptoJS = require('crypto-js');

const encrypt = (text, key) => {
  return CryptoJS.AES.encrypt(text, key);
};

const decrypt = (data, key) => {
  return CryptoJS.AES.decrypt(data, key);
};

//var salt = CryptoJS.lib.WordArray.random(128/8);
//var key128Bits = CryptoJS.PBKDF2("Secret Passphrase", salt, { keySize: 128/32 });

var encryptedAES = encrypt("Message", "My Secret Passphrase");
var decryptedBytes = decrypt(encryptedAES, "My Secret Passphrase");
var plaintext = decryptedBytes.toString(CryptoJS.enc.Utf8);

console.log("encrypted");
console.log(encryptedAES.toString());
console.log("decrypted");
console.log("utf8: " + decryptedBytes.toString());
console.log("text: " + plaintext);
