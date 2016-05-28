.class public Lit/sephiroth/android/library/exif2/Rational;
.super Ljava/lang/Object;
.source "Rational.java"


# instance fields
.field private final mDenominator:J

.field private final mNumerator:J


# direct methods
.method public constructor <init>(JJ)V
    .registers 6
    .param p1, "nominator"    # J
    .param p3, "denominator"    # J

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-wide p1, p0, Lit/sephiroth/android/library/exif2/Rational;->mNumerator:J

    .line 36
    iput-wide p3, p0, Lit/sephiroth/android/library/exif2/Rational;->mDenominator:J

    .line 37
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 10
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 71
    if-nez p1, :cond_5

    .line 81
    :cond_4
    :goto_4
    return v2

    .line 74
    :cond_5
    if-ne p0, p1, :cond_9

    move v2, v1

    .line 75
    goto :goto_4

    .line 77
    :cond_9
    instance-of v3, p1, Lit/sephiroth/android/library/exif2/Rational;

    if-eqz v3, :cond_4

    move-object v0, p1

    .line 78
    check-cast v0, Lit/sephiroth/android/library/exif2/Rational;

    .line 79
    .local v0, "data":Lit/sephiroth/android/library/exif2/Rational;
    iget-wide v4, p0, Lit/sephiroth/android/library/exif2/Rational;->mNumerator:J

    iget-wide v6, v0, Lit/sephiroth/android/library/exif2/Rational;->mNumerator:J

    cmp-long v3, v4, v6

    if-nez v3, :cond_22

    iget-wide v4, p0, Lit/sephiroth/android/library/exif2/Rational;->mDenominator:J

    iget-wide v6, v0, Lit/sephiroth/android/library/exif2/Rational;->mDenominator:J

    cmp-long v3, v4, v6

    if-nez v3, :cond_22

    :goto_20
    move v2, v1

    goto :goto_4

    :cond_22
    move v1, v2

    goto :goto_20
.end method

.method public getDenominator()J
    .registers 3

    .prologue
    .line 58
    iget-wide v0, p0, Lit/sephiroth/android/library/exif2/Rational;->mDenominator:J

    return-wide v0
.end method

.method public getNumerator()J
    .registers 3

    .prologue
    .line 51
    iget-wide v0, p0, Lit/sephiroth/android/library/exif2/Rational;->mNumerator:J

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v2, p0, Lit/sephiroth/android/library/exif2/Rational;->mNumerator:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lit/sephiroth/android/library/exif2/Rational;->mDenominator:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
