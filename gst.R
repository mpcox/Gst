# G'st (Hedrick's 2005 corrected Gst estimator)

gst_prime <- function (k, hs, ht){
	
	gst <- (ht - hs) / ht
	upper <- gst * (k - 1 + hs)
	lower <- (k - 1) * (1 - hs)
	corrected_gst <- upper / lower
	
	return(corrected_gst)
}

# example
gst_prime(14, 0.9534, 0.981)
