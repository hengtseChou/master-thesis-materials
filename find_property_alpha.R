### experiment

# 1. a working design for m=8
# do not change this
e1 <- rep(0:2, each = 27)
e2 <- rep(0:2, each = 9, 3)
e3 <- rep(0:2, each = 3, 9)
e4 <- rep(0:2, each = 1, 27)

A <- cbind(
  (e1 + e4),
  (e1 * 2 + e4),
  (e2 + e4),
  (e2 * 2 + e4),
  (e1 + e2 + e3),
  (e1 * 2 + e2 * 2 + e3),
  (e1 + e2 * 2 + e3),
  (e1 * 2 + e2 + e3)
)
A <- A %% 3

B <- cbind(
  (e2 + e3),
  (e2 * 2 + e3),
  (e1 * 2 + e3),
  (e1 + e3),
  (e1 + e2 * 2 + e4),
  (e1 * 2 + e2 + e4),
  (e1 * 2 + e2 * 2 + e4),
  (e1 + e2 + e4)
)
B <- B %% 3

# c_j can by any column other than a_j, b_j, a_j b_j, a_j b_j^2
C <- matrix(e3, length(e3), ncol(A))
C <- C %% 3

# D = s^2 * A + s * B + C
D <- 9 * A + 3 * B + C
D <- floor(D / 3)

has_property(D, 3, s22)
has_property(D, 3, s21)
has_property(D, 3, s11)
has_property(D, 3, s111)


# ckeck k=6
e1 <- rep(0:2, each = 243, times = 1)
e2 <- rep(0:2, each = 81, times = 3)
e3 <- rep(0:2, each = 27, times = 9)
e4 <- rep(0:2, each = 9, times = 27)
e5 <- rep(0:2, each = 3, times = 81)
e6 <- rep(0:2, each = 1, times = 243)

base_A <- cbind(
  (e1 + e4),
  (e1 * 2 + e4),
  (e2 + e4),
  (e2 * 2 + e4),
  (e1 + e2 + e3),
  (e1 * 2 + e2 * 2 + e3),
  (e1 + e2 * 2 + e3),
  (e1 * 2 + e2 + e3)
)
base_B <- cbind(
  (e2 + e3),
  (e2 * 2 + e3),
  (e1 * 2 + e3),
  (e1 + e3),
  (e1 + e2 * 2 + e4),
  (e1 * 2 + e2 + e4),
  (e1 * 2 + e2 * 2 + e4),
  (e1 + e2 + e4)
)

A <- cbind(
  base_A,
  base_A + (e5),
  base_A + (e5 * 2),
  base_A + (e6),
  base_A + (e6 * 2),
  base_A + (e5 + e6),
  base_A + (e5 * 2 + e6 * 2),
  base_A + (e5 + e6 * 2),
  base_A + (e5 * 2 + e6)
)
A <- A %% 3

B <- cbind(
  base_B,
  base_B + (e6),
  base_B + (e6 * 2),
  base_B + (e5 * 2),
  base_B + (e5),
  base_B + (e5 + e6 * 2),
  base_B + (e5 * 2 + e6),
  base_B + (e5 * 2 + e6 * 2),
  base_B + (e5 + e6)
)
B <- B %% 3

# c_j can by any column other than a_j, b_j, a_j b_j, a_j b_j^2
C <- matrix(e5, length(e5), ncol(A))
C <- C %% 3

# D = s^2 * A + s * B + C
# it does not matter if C is added or not
D <- 9 * A + 3 * B
D <- floor(D / 3)

has_property(D, 3, s22) # true
has_property(D, 3, s21) # true
has_property(D, 3, s11) # true
has_property(D, 3, s111) # false

find_bad_combination(D, 3, s22)
find_bad_combination(D, 3, s111)