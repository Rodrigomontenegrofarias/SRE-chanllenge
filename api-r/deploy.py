from flask import Flask, render_template, request
import pickle

app = Flask(__name__)
# load the model
model = pickle.load(open('pickle_model.pkl', 'rb'))

@app.route('/')
def home():
    result = ''
    return render_template('index.html', **locals())


@app.route('/predict', methods=['POST', 'GET'])
def predict():
    var1 = float(request.form['var1'])
    var2 = float(request.form['var2'])
    var3 = float(request.form['var3'])
    var4 = float(request.form['var4'])
    var5 = float(request.form['var5'])
    var6 = float(request.form['var6'])
    var7 = float(request.form['var7'])
    var8 = float(request.form['var8'])
    var9 = float(request.form['var9'])
    var10 = float(request.form['var10'])
    var11 = float(request.form['var11'])
    var12 = float(request.form['var12'])
    var13 = float(request.form['var13'])
    var14 = float(request.form['var14'])
    var15 = float(request.form['var15'])
    var16 = float(request.form['var16'])
    var17 = float(request.form['var17'])
    var18 = float(request.form['var18'])
    var19 = float(request.form['var19'])
    var20 = float(request.form['var20'])
    var21 = float(request.form['var21'])
    var22 = float(request.form['var22'])
    var23 = float(request.form['var23'])
    var24 = float(request.form['var24'])
    var25 = float(request.form['var25'])
    var26 = float(request.form['var26'])
    var27 = float(request.form['var27'])
    var28 = float(request.form['var28'])
    var29 = float(request.form['var29'])
    var30 = float(request.form['var30'])
    var31 = float(request.form['var31'])
    var32 = float(request.form['var32'])
    var33 = float(request.form['var33'])
    var34 = float(request.form['var34'])
    var35 = float(request.form['var35'])
    var36 = float(request.form['var36'])

    
    
    


    result = model.predict([[var1, var2, var3, var4,var5, var6, var7, var8,var9, var10,
     var11, var12,var13, var14, var15, var16,var17, var18, var19, var20,var21, var22,
     var23, var24,var24, var25, var26, var27, var28, var29, var30,var31, var32,
     var33, var34,var35,var36]])[0]
    return render_template('index.html', **locals())

if __name__ == '__main__':
    app.run(debug=True)
