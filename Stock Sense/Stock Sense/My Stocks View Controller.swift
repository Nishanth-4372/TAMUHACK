//
//  My Stocks View Controller.swift
//  Stock Sense
//
//  Created by Ananya Adiki on 1/27/24.
//

import UIKit

class My_Stocks_View_Controller: UIViewController {
    @IBOutlet weak var s2n1: UILabel!
    @IBOutlet weak var s2n2: UILabel!
    @IBOutlet weak var s2n3: UILabel!
    @IBOutlet weak var s2n4: UILabel!
    @IBOutlet weak var s2n5: UILabel!
    
    @IBOutlet weak var s2c1: UILabel!
    @IBOutlet weak var s2c2: UILabel!
    @IBOutlet weak var s2c3: UILabel!
    @IBOutlet weak var s2c4: UILabel!
    @IBOutlet weak var s2c5: UILabel!
    
    @IBOutlet weak var s2p1: UILabel!
    @IBOutlet weak var s2p2: UILabel!
    @IBOutlet weak var s2p3: UILabel!
    @IBOutlet weak var s2p4: UILabel!
    @IBOutlet weak var s2p5: UILabel!
    
    @IBOutlet weak var s3n1: UILabel!
    @IBOutlet weak var s3n2: UILabel!
    @IBOutlet weak var s3n3: UILabel!
    @IBOutlet weak var s3n4: UILabel!
    @IBOutlet weak var s3n5: UILabel!
    
    @IBOutlet weak var s3c1: UILabel!
    @IBOutlet weak var s3c2: UILabel!
    @IBOutlet weak var s3c3: UILabel!
    @IBOutlet weak var s3c4: UILabel!
    @IBOutlet weak var s3c5: UILabel!
    
    @IBOutlet weak var s3p1: UILabel!
    @IBOutlet weak var s3p2: UILabel!
    @IBOutlet weak var s3p3: UILabel!
    @IBOutlet weak var s3p4: UILabel!
    @IBOutlet weak var s3p5: UILabel!
    
    @IBOutlet weak var s1n3: UILabel!
    @IBOutlet weak var s1n4: UILabel!
    @IBOutlet weak var s1c1: UILabel!
    @IBOutlet weak var s1c2: UILabel!
    @IBOutlet weak var s1c3: UILabel!
    @IBOutlet weak var s1c4: UILabel!
    @IBOutlet weak var s1c5: UILabel!
    @IBOutlet weak var s1p1: UILabel!
    @IBOutlet weak var s1p2: UILabel!
    var user: String = ""
    @IBOutlet weak var s1p3: UILabel!
    @IBOutlet weak var s1n1: UILabel!
    @IBOutlet weak var s1n2: UILabel!
    @IBOutlet weak var s1n5: UILabel!
    @IBOutlet weak var s1p4: UILabel!
    @IBOutlet weak var s1p5: UILabel!
    let defaults = UserDefaults.standard
    @IBOutlet var stocksector1: UILabel!
    @IBOutlet var stocksector2: UILabel!
    @IBOutlet var stocksector3: UILabel!
    var namesList: [String] = []
    var codes: [String] = []
    var percents: [Double] = []
    var index: Int = 0
    
    
    var techsector: [[String]] = [["Broadcom Inc.","AVGO","40.91011820352316"], ["ASML Holding N.V.", "ASML", "31.28433075000002"], ["Lam Research Corporation","LRCX","30.219205927559717"], ["ServiceNow Inc.","NOW", "27.23675025000001"], ["Adobe Inc.","ADBE","23.573599213119884"], ["Intuit Inc.", "INTU", "23.554737749999997"], ["KLA Corporation","KLAC", "22.523646057138368"],["Synopsys Inc.","SNPS","21.209531808691835"]]
    
    var energysector: [[String]] = [["Chevron Corporation", "CVX", "6.955005346452127"], ["ConocoPhillips", "COP", "5.011859618410696"], ["Exxon Mobil Corporation", "XOM", "4.752043962179938"], ["TotalEnergies SE", "TTE", "2.8593500638366827"], ["Shell plc", "SHEL", "2.8268265001711947"], ["Enbridge Inc.", "ENB", "1.6523376558861582"], ["BP p.l.c.", "BP", "1.640848993416494"], ["Equinor ASA", "EQNR", "1.3937624776518722"], ["Petróleo Brasileiro S.A. - Petrobras", "PBR", "0.6428475"]]
    
    var materialsector: [[String]] = [[]]
    
    var industrialsector: [[String]] = [["Lockheed Martin Corporation", "LMT", "20.372758932700997"], ["Deere & Company", "DE", "17.57909604779338"], ["Caterpillar Inc.", "CAT", "11.608387267499998"], ["Illinois Tool Works Inc.", "ITW", "10.999964764753344"], ["Automatic Data Processing Inc.", "ADP", "10.412559484679669"], ["The Boeing Company", "BA", "9.945065677943187"], ["Union Pacific Corporation", "UNP", "9.89265927668435"], ["Eaton Corporation plc", "ETN", "9.557947500000003"], ["Honeywell International Inc.", "HON", "8.891767442492386"], ["United Parcel Service Inc.", "UPS", "7.51200900518719"], ["Canadian National Railway Company", "CNI", "5.335947090561648"], ["General Electric Company", "GE", "5.147845499999995"], ["RTX Corporation", "RTX", "3.9860039814746875"], ["RELX PLC", "RELX", "1.5942622500000003"]]
    
    var utilitiessector: [[String]] = [[]]
    
    var healthsector: [[String]] = [["Regeneron Pharmaceuticals Inc.", "REGN", "36.55641377287856"], ["Eli Lilly and Company", "LLY", "23.666258250000006"], ["Thermo Fisher Scientific Inc.", "TMO", "23.613610752421096"], ["UnitedHealth Group Incorporated", "UNH", "22.94919077554342"], ["Elevance Health Inc.", "ELV", "20.901137097582225"], ["Vertex Pharmaceuticals Incorporated", "VRTX", "16.438502555605744"], ["Intuitive Surgical Inc.", "ISRG", "14.313937048503211"], ["Stryker Corporation", "SYK", "13.100936531928218"], ["The Cigna Group", "CI", "12.700856535835864"], ["Amgen Inc.", "AMGN", "11.662082250000003"], ["Danaher Corporation", "DHR", "9.886069999803311"], ["Zoetis Inc.", "ZTS", "8.170686342253102"], ["Johnson & Johnson", "JNJ", "7.229758455474702"], ["AbbVie Inc.", "ABBV", "6.684619174337188"], ["Merck & Co. Inc.", "MRK", "4.947787500000001"], ["Abbott Laboratories", "ABT", "4.810638296610173"], ["Novartis AG", "NVS", "4.53278296135266"], ["Novo Nordisk A/S", "NVO", "4.162273874999998"], ["Medtronic plc", "MDT", "3.7779535850244925"], ["Gilead Sciences  Inc.", "GILD", "3.568069367429962"], ["CVS Health Corporation", "CVS", "3.283390258025122"], ["AstraZeneca PLC", "AZN", "3.1085737808096567"], ["Bristol-Myers Squibb Company", "BMY", "2.655047163265306"], ["Boston Scientific Corporation", "BSX", "2.439443250000002"], ["Sanofi", "SNY", "2.324619982704004"], ["GSK plc", "GSK", "1.6564216423021172"], ["Pfizer Inc.", "PFE", "1.545239314010098"]]
    
    var finsector: [[String]] = [["BlackRock Inc.", "BLK", "32.37297456976437"], ["Mastercard Incorporated", "MA", "18.0395835"], ["S&P Global Inc.", "SPGI", "17.997690749999997"], ["The Goldman Sachs Group Inc.", "GS", "15.522818722359819"], ["Visa Inc.", "V", "11.020420400659523"], ["Chubb Limited", "CB", "9.480375084910955"], ["Marsh & McLennan Companies Inc.", "MMC", "8.507862214180951"], ["American Express Company", "AXP", "7.579368750000003"], ["JPMorgan Chase & Co.", "JPM", "6.84984675"], ["The Progressive Corporation", "PGR", "6.555605249999997"], ["Blackstone Inc.", "BX", "4.709335475784902"], ["Royal Bank of Canada", "RY", "4.263669146067416"], ["Morgan Stanley", "MS", "3.877017805708769"], ["KKR & Co. Inc.", "KKR", "2.949708750000001"], ["HDFC Bank Limited", "HDB", "2.9265402898241875"], ["The Toronto-Dominion Bank", "TD", "2.793471413681068"], ["The Charles Schwab Corporation", "SCHW", "2.699224490885696"], ["Citigroup Inc.", "C", "2.1396411074746426"], ["Wells Fargo & Company", "WFC", "1.993340132616487"], ["HSBC Holdings plc", "HSBC", "1.7503935780075177"], ["Bank of America Corporation", "BAC", "1.3881922281864834"], ["UBS Group AG", "UBS", "1.108285803278689"], ["ICICI Bank Limited", "IBN", "1.0508748005181343"], ["Mitsubishi UFJ Financial Group Inc.", "MUFG", "0.3557592118473894"]]
    
    var realsector: [[String]] = [["American Tower Corporation", "AMT", "8.855132693705823"], ["Prologis Inc.", "PLD", "5.55000027371983"]]
    
    var commsector: [[String]] = [["Netflix Inc.", "NFLX", "19.47219"], ["Meta Platforms Inc.", "META", "13.844085374999997"], ["T-Mobile US Inc.", "TMUS", "6.597681817436857"], ["Alphabet Inc.", "GOOGL", "5.816997375"], ["The Walt Disney Company", "DIS", "4.121704440018389"], ["Comcast Corporation", "CMCSA", "1.9227201340508806"], ["Verizon Communications Inc.", "VZ", "1.6626659946808509"], ["AT&T Inc.", "T", "0.7558518575044743"]]
    
    var staplessector: [[String]] = [["Booking Holdings Inc.", "BKNG", "137.35176601660413"], ["MercadoLibre Inc.", "MELI", "62.859863249999975"], ["Ferrari N.V.", "RACE", "14.558096146558242"], ["The Home Depot Inc.", "HD", "14.37476845943517"], ["McDonald Corporation", "MCD", "12.952646012943315"], ["Tesla Inc.", "TSLA", "10.423624182579772"], ["Lowe's Companies Inc.", "LOW", "9.649034023081928"], ["Toyota Motor Corporation", "TM", "7.6692420948209445"], ["Amazon.com Inc.", "AMZN", "6.0903558985532715"], ["Airbnb Inc.", "ABNB", "5.8945347759404845"], ["NIKE Inc.", "NKE", "4.968952685105166"], ["PDD Holdings Inc.", "PDD", "4.674830876748832"], ["Starbucks Corporation", "SBUX", "4.487379110074626"], ["The TJX Companies Inc.", "TJX", "3.9100365000000017"], ["Alibaba Group Holding Limited", "BABA", "3.7574146724879958"]]
    
    var discsector: [[String]] = [["Costco Wholesale Corporation", "COST", "25.94564917232912"], ["PepsiCo Inc.", "PEP", "7.98810025"], ["Diageo plc", "DEO", "7.228669968158529"], ["Walmart Inc.", "WMT", "7.0423080967691"], ["The Procter & Gamble Company", "PG", "6.775602337611316"], ["Fomento Económico Mexicano", " S.A.B. de C.V. FMX", "5.210999250000002"], ["Philip Morris International Inc.", "PM", "4.289381066207699"], ["Mondelez International Inc.", "MDLZ", "3.263197988319623"], ["The Coca-Cola Company", "KO", "2.722024091686555"], ["Anheuser-Busch InBev SA/NV", "BUD", "2.7208965726092083"], ["Unilever PLC", "UL", "2.2845197121554928"]]
    
    
    
    
    
    
    /*/, "NVIDIA Corporation": ["NVDA", 19.915492500000006], "Microsoft Corporation": ["MSFT", 15.621108375], "Accenture plc": ["ACN", 14.396119500000006], "Palo Alto Networks Inc.": ["PANW", 11.48617094221899], "Cadence Design Systems Inc.": ["CDNS", 11.060119318990157], "Salesforce Inc.": ["CRM", 10.28713907 6810728], "Arista Networks Inc.": ["ANET", 8.768379639171403], "Analog Devices Inc.": ["ADI", 8.384366177494346], "Apple Inc.": ["AAPL", 8.297627641990465], "Texas Instruments Incorporated": ["TXN", 7.531600053291193], "International Business Machines Corporation": ["IBM", 6.599864625000002], "SAP SE": ["SAP", 6.465153750000002], "Applied Materials Inc.": ["AMAT", 6.464042679372318], "QUALCOMM Incorporated": ["QCOM", 5.631762201763489], "Advanced Micro Devices Inc.": ["AMD", 5.4276707742121335], "Oracle Corporation": ["ORCL", 4.943695456832249], "Taiwan Semiconductor Manufacturing Company Limited": ["TSM", 4.40176205490783], "Sony Group Corporation": ["SONY", 4.112157311937645], "Micron Technology Inc.": ["MU", 3.255724720183487], "Shopify Inc.": ["SHOP", 2.9632709355377083], "Cisco Systems Inc.": ["CSCO", 2.2926761568026244], "Uber Technologies Inc.": ["UBER", 2.225264250000001], "Intel Corporation": ["INTC", 1.738014250238961], "Infosys Limited": ["INFY", 0.7876531276171488]]*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stocksector1.text = (defaults.value(forKey: "\(user) sector1") as! String)
        stocksector2.text = (defaults.value(forKey: "\(user) sector2") as! String)
        stocksector3.text = (defaults.value(forKey: "\(user) sector3") as! String)
        
        for data1 in whichSector(sector: stocksector1.text!){
            namesList.append(data1[0])
            codes.append(data1[1])
            percents.append(Double(data1[2])!)
        }
        
        for i in 0...4{
            if i == 0{
                s1n1.text = namesList[i]
                s1c1.text = codes[i]
                s1p1.text = "\(percents[i])"
            }else if i == 1{
                s1n2.text = namesList[i]
                s1c2.text = codes[i]
                s1p2.text = "\(percents[i])"
            }else if i == 2{
                s1n3.text = namesList[i]
                s1c3.text = codes[i]
                s1p3.text = "\(percents[i])"
            }else if i == 3{
                s1n4.text = namesList[i]
                s1c4.text = codes[i]
                s1p4.text = "\(percents[i])"
            }else if i == 4{
                s1n5.text = namesList[i]
                s1c5.text = codes[i]
                s1p5.text = "\(percents[i])"
            }
        }
        namesList = []
        codes = []
        percents = []
        for data2 in whichSector(sector: stocksector2.text!){
            namesList.append(data2[0])
            codes.append(data2[1])
            percents.append(Double(data2[2])!)
            
        }
        for i in 0...4{
            if i == 0{
                s2n1.text = namesList[i]
                s2c1.text = codes[i]
                s2p1.text = "\(percents[i])"
            }else if i == 1{
                s2n2.text = namesList[i]
                s2c2.text = codes[i]
                s2p2.text = "\(percents[i])"
            }else if i == 2{
                s2n3.text = namesList[i]
                s2c3.text = codes[i]
                s2p3.text = "\(percents[i])"
            }else if i == 3{
                s2n4.text = namesList[i]
                s2c4.text = codes[i]
                s2p4.text = "\(percents[i])"
            }else if i == 4{
                s2n5.text = namesList[i]
                s2c5.text = codes[i]
                s2p5.text = "\(percents[i])"
            }
        }
        
        namesList = []
        codes = []
        percents = []
        for data3 in whichSector(sector: stocksector3.text!){
            namesList.append(data3[0])
            codes.append(data3[1])
            percents.append(Double(data3[2])!)
        }
        for i in 0...4{
            if i == 0{
                s3n1.text = namesList[i]
                s3c1.text = codes[i]
                s3p1.text = "\(percents[i])"
            }else if i == 1{
                s3n2.text = namesList[i]
                s3c2.text = codes[i]
                s3p2.text = "\(percents[i])"
            }else if i == 2{
                s3n3.text = namesList[i]
                s3c3.text = codes[i]
                s3p3.text = "\(percents[i])"
            }else if i == 3{
                s3n4.text = namesList[i]
                s3c4.text = codes[i]
                s3p4.text = "\(percents[i])"
            }else if i == 4{
                s3n5.text = namesList[i]
                s3c5.text = codes[i]
                s3p5.text = "\(percents[i])"
            }
        }
    }
    
    func whichSector(sector: String) -> [Array<String>]{
        if sector == "Information Technology"{
            return techsector
        }else if sector == "Energy"{
            return energysector
        }else if sector == "Materials"{
            return materialsector
        }else if sector == "Industrials"{
            return industrialsector
        }else if sector == "Utilities"{
            return utilitiessector
        }else if sector == "Healthcare"{
            return healthsector
        }else if sector == "Financials"{
            return finsector
        }else if sector == "Real Estate"{
            return realsector
        }else if sector == "Communication Services"{
            return commsector
        }else if sector == "Consumer Staples"{
            return staplessector
        }else if sector == "Consumer Discretionary"{
            return discsector
        }else {
            return [[]]
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        defaults.set(s1n1.text!, forKey: "Stock1")
        defaults.set(s2n1.text!, forKey: "Stock2")
        defaults.set(s3n1.text!, forKey: "Stock3")
    }

}
