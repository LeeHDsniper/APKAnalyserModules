.class public final Lcom/google/android/gms/internal/zzsa;
.super Ljava/lang/Object;


# static fields
.field public static final zzbcn:[I

.field public static final zzbco:[J

.field public static final zzbcp:[F

.field public static final zzbcq:[D

.field public static final zzbcr:[Z

.field public static final zzbcs:[Ljava/lang/String;

.field public static final zzbct:[[B

.field public static final zzbcu:[B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/4 v1, 0x0

    new-array v0, v1, [I

    sput-object v0, Lcom/google/android/gms/internal/zzsa;->zzbcn:[I

    new-array v0, v1, [J

    sput-object v0, Lcom/google/android/gms/internal/zzsa;->zzbco:[J

    new-array v0, v1, [F

    sput-object v0, Lcom/google/android/gms/internal/zzsa;->zzbcp:[F

    new-array v0, v1, [D

    sput-object v0, Lcom/google/android/gms/internal/zzsa;->zzbcq:[D

    new-array v0, v1, [Z

    sput-object v0, Lcom/google/android/gms/internal/zzsa;->zzbcr:[Z

    new-array v0, v1, [Ljava/lang/String;

    sput-object v0, Lcom/google/android/gms/internal/zzsa;->zzbcs:[Ljava/lang/String;

    new-array v0, v1, [[B

    sput-object v0, Lcom/google/android/gms/internal/zzsa;->zzbct:[[B

    new-array v0, v1, [B

    sput-object v0, Lcom/google/android/gms/internal/zzsa;->zzbcu:[B

    return-void
.end method

.method static zzE(II)I
    .registers 3

    shl-int/lit8 v0, p0, 0x3

    or-int/2addr v0, p1

    return v0
.end method

.method public static final zzb(Lcom/google/android/gms/internal/zzrp;I)I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrp;->getPosition()I

    move-result v1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzrp;->zzlj(I)Z

    :goto_8
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrp;->zzCT()I

    move-result v2

    if-ne v2, p1, :cond_14

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzrp;->zzlj(I)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_14
    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzrp;->zzln(I)V

    return v0
.end method

.method static zzlD(I)I
    .registers 2

    and-int/lit8 v0, p0, 0x7

    return v0
.end method

.method public static zzlE(I)I
    .registers 2

    ushr-int/lit8 v0, p0, 0x3

    return v0
.end method
