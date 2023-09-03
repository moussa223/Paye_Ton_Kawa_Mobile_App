const Firestore = require('@google-cloud/firestore');
// Use your project ID here
const PROJECTID = 'mspr-ras';
const COLLECTION_NAME = '';

const firestore = new Firestore({
    projectId: PROJECTID,
    timestampsInSnapshots: true
    // NOTE: Don't hardcode your project credentials here.
    // If you have to, export the following to your shell:
    //   GOOGLE_APPLICATION_CREDENTIALS=<path>
    // keyFilename: '/cred/cloud-functions-firestore-000000000000.json',
  });

const functions = require("firebase-functions");
exports.sendEmail = functions.auth.user().beforeSignIn(async (user) => {
    // read/retrieve an existing document by ID

    var token = Math.random(10000000);
    firestore
              .collection('user')
              .doc(user.uid)
              .update({'auth_token': token});
   firestore.collection('user')
  .doc(user.uid)
  .get()
  .then(snapshot => {
    token = snapshot.auth_token;
    functions.logger.info(snapshot.id + " " + snapshot.auth_token + " triggered mail send ", { structuredData: true });

    const qr = new QRious();
    qr.value = token;
  
    var storageRef = firebase.storage().ref();
    var ref = storageRef.child('qr.png');
    ref.putString(qr.toDataURL(), 'data_url').then(function(snapshot) {
      console.log('Uploaded a data_url string!');
    });
  });
});