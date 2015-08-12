import flintstone


def fred():
    print "fred!"

def bambam(number):
    print("bambam: I want %d Brontosaurus Burgers!" % number)

flintstone.fred = fred
flintstone.bambam = bambam

flintstone.test()
flintstone.barney()


