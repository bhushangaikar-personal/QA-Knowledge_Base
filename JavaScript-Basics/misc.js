const myPromise = new Promise((resolve, reject) => {
    setTimeout(() => {
        const success = Math.random > 0.5;
        if(success){
            resolve.success("Execuation successful")
        }else {
            reject(new Error('Operation Failed'));            
        }}, 1000);
    });
    

myPromise
.then(result => console.log('Success', result))
.catch(error => console.log('error', error.message));