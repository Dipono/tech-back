const express = require('express')
const bodyParser = require('body-parser')   //used by xampp to pass json data
const mysql = require('mysql2')
const app = express()
const connection = require ('../DATABASE/database')

// WORKING WITH MULTER PACKAGE (Multer works a a middleware)
const path = require('path')
const multer = require ('multer')
// *****************************************IMPORT IMAGE********************************************
const storage = multer.diskStorage ({
	destination: (req, file, cd)=>{
		cd(null,'images')	//images is the folder
	},
	filename: (req, file, cb) => {
		console.log(file)
		cb(null, Date.now() + path.extname(file.originalname))
	}
})
const upload = multer ({storage: storage})	//middleware

// UPLOAD PICTURE API
app.get("/upload", (req,res)=>{
	res.render("upload");		//upload is a html file
});

app.post("/upload", upload.single("image"),(req,res)=>{	//you can change the middleware to array
	res.send("Image Uploaded");
});
//***************************************CLOUDINARY************************************************* */

// app.use('/upload-images', upload.array('upload'), async (req, res) => {
//     const Uploader = async (path) => await cloudinary.uploads(path, 'Images')

//     if(req.method === 'POST')
//     {
//         const urls = []
//         const files = req.files

//         for(const file of files){
//             const {path} = file

//             const newPath = await Uploader(path)

//             urls.push(newPath)

//             fs.unlinkSync(path)
//         }
//         res.status(200).json({
//             message:'Images Uploaded Successfully', 
//             data:urls   //return data
//         })
//         // res.send( `Record ${params.jobcard_id} has been added`).status(200)
//     }
//     else{
//         res.status(400).json({
//             err:'Image Upload Unsuccessful', 
//             data:urls   //return data
//         })
//     }
// })
module.exports = app;