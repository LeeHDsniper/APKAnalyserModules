.class Lcom/google/android/gms/internal/zzrt;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final zzbcd:Lcom/google/android/gms/internal/zzru;


# instance fields
.field private mSize:I

.field private zzbce:Z

.field private zzbcf:[I

.field private zzbcg:[Lcom/google/android/gms/internal/zzru;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/internal/zzru;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzru;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzrt;->zzbcd:Lcom/google/android/gms/internal/zzru;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzrt;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 5

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzrt;->zzbce:Z

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzrt;->idealIntArraySize(I)I

    move-result v0

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    new-array v0, v0, [Lcom/google/android/gms/internal/zzru;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    iput v2, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    return-void
.end method

.method private gc()V
    .registers 9

    const/4 v2, 0x0

    iget v3, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    iget-object v4, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    iget-object v5, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    move v1, v2

    move v0, v2

    :goto_9
    if-ge v1, v3, :cond_21

    aget-object v6, v5, v1

    sget-object v7, Lcom/google/android/gms/internal/zzrt;->zzbcd:Lcom/google/android/gms/internal/zzru;

    if-eq v6, v7, :cond_1e

    if-eq v1, v0, :cond_1c

    aget v7, v4, v1

    aput v7, v4, v0

    aput-object v6, v5, v0

    const/4 v6, 0x0

    aput-object v6, v5, v1

    :cond_1c
    add-int/lit8 v0, v0, 0x1

    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_21
    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzrt;->zzbce:Z

    iput v0, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    return-void
.end method

.method private idealByteArraySize(I)I
    .registers 5
    .param p1, "need"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v0, 0x4

    :goto_2
    const/16 v1, 0x20

    if-ge v0, v1, :cond_10

    shl-int v1, v2, v0

    add-int/lit8 v1, v1, -0xc

    if-gt p1, v1, :cond_11

    shl-int v0, v2, v0

    add-int/lit8 p1, v0, -0xc

    .end local p1    # "need":I
    :cond_10
    return p1

    .restart local p1    # "need":I
    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method private idealIntArraySize(I)I
    .registers 3
    .param p1, "need"    # I

    .prologue
    mul-int/lit8 v0, p1, 0x4

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzrt;->idealByteArraySize(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x4

    return v0
.end method

.method private zza([I[II)Z
    .registers 8

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    if-ge v1, p3, :cond_e

    aget v2, p1, v1

    aget v3, p2, v1

    if-eq v2, v3, :cond_b

    :goto_a
    return v0

    :cond_b
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_e
    const/4 v0, 0x1

    goto :goto_a
.end method

.method private zza([Lcom/google/android/gms/internal/zzru;[Lcom/google/android/gms/internal/zzru;I)Z
    .registers 8

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    if-ge v1, p3, :cond_12

    aget-object v2, p1, v1

    aget-object v3, p2, v1

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzru;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    :goto_e
    return v0

    :cond_f
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_12
    const/4 v0, 0x1

    goto :goto_e
.end method

.method private zzlC(I)I
    .registers 6

    const/4 v1, 0x0

    iget v0, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    add-int/lit8 v0, v0, -0x1

    :goto_5
    if-gt v1, v0, :cond_1b

    add-int v2, v1, v0

    ushr-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    aget v3, v3, v2

    if-ge v3, p1, :cond_14

    add-int/lit8 v1, v2, 0x1

    goto :goto_5

    :cond_14
    if-le v3, p1, :cond_19

    add-int/lit8 v0, v2, -0x1

    goto :goto_5

    :cond_19
    move v0, v2

    :goto_1a
    return v0

    :cond_1b
    xor-int/lit8 v0, v1, -0x1

    goto :goto_1a
.end method


# virtual methods
.method public synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrt;->zzDn()Lcom/google/android/gms/internal/zzrt;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_5

    .end local p1    # "o":Ljava/lang/Object;
    :cond_4
    :goto_4
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_5
    instance-of v2, p1, Lcom/google/android/gms/internal/zzrt;

    if-nez v2, :cond_b

    move v0, v1

    goto :goto_4

    :cond_b
    check-cast p1, Lcom/google/android/gms/internal/zzrt;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrt;->size()I

    move-result v2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrt;->size()I

    move-result v3

    if-eq v2, v3, :cond_19

    move v0, v1

    goto :goto_4

    :cond_19
    iget-object v2, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    iget-object v3, p1, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    iget v4, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    invoke-direct {p0, v2, v3, v4}, Lcom/google/android/gms/internal/zzrt;->zza([I[II)Z

    move-result v2

    if-eqz v2, :cond_31

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    iget v4, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    invoke-direct {p0, v2, v3, v4}, Lcom/google/android/gms/internal/zzrt;->zza([Lcom/google/android/gms/internal/zzru;[Lcom/google/android/gms/internal/zzru;I)Z

    move-result v2

    if-nez v2, :cond_4

    :cond_31
    move v0, v1

    goto :goto_4
.end method

.method public hashCode()I
    .registers 4

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzrt;->zzbce:Z

    if-eqz v0, :cond_7

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzrt;->gc()V

    :cond_7
    const/16 v1, 0x11

    const/4 v0, 0x0

    :goto_a
    iget v2, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    if-ge v0, v2, :cond_23

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    aget v2, v2, v0

    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzru;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    :cond_23
    return v1
.end method

.method public isEmpty()Z
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrt;->size()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public size()I
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzrt;->zzbce:Z

    if-eqz v0, :cond_7

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzrt;->gc()V

    :cond_7
    iget v0, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    return v0
.end method

.method public final zzDn()Lcom/google/android/gms/internal/zzrt;
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrt;->size()I

    move-result v1

    new-instance v2, Lcom/google/android/gms/internal/zzrt;

    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/zzrt;-><init>(I)V

    iget-object v3, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    iget-object v4, v2, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    invoke-static {v3, v0, v4, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_11
    if-ge v0, v1, :cond_28

    iget-object v3, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    aget-object v3, v3, v0

    if-eqz v3, :cond_25

    iget-object v3, v2, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    aget-object v4, v4, v0

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzru;->zzDo()Lcom/google/android/gms/internal/zzru;

    move-result-object v4

    aput-object v4, v3, v0

    :cond_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    :cond_28
    iput v1, v2, Lcom/google/android/gms/internal/zzrt;->mSize:I

    return-object v2
.end method

.method public zza(ILcom/google/android/gms/internal/zzru;)V
    .registers 9

    const/4 v5, 0x0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzrt;->zzlC(I)I

    move-result v0

    if-ltz v0, :cond_c

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    aput-object p2, v1, v0

    :goto_b
    return-void

    :cond_c
    xor-int/lit8 v0, v0, -0x1

    iget v1, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    if-ge v0, v1, :cond_23

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    aget-object v1, v1, v0

    sget-object v2, Lcom/google/android/gms/internal/zzrt;->zzbcd:Lcom/google/android/gms/internal/zzru;

    if-ne v1, v2, :cond_23

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    aput p1, v1, v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    aput-object p2, v1, v0

    goto :goto_b

    :cond_23
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbce:Z

    if-eqz v1, :cond_37

    iget v1, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    array-length v2, v2

    if-lt v1, v2, :cond_37

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzrt;->gc()V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzrt;->zzlC(I)I

    move-result v0

    xor-int/lit8 v0, v0, -0x1

    :cond_37
    iget v1, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    array-length v2, v2

    if-lt v1, v2, :cond_5e

    iget v1, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    add-int/lit8 v1, v1, 0x1

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/zzrt;->idealIntArraySize(I)I

    move-result v1

    new-array v2, v1, [I

    new-array v1, v1, [Lcom/google/android/gms/internal/zzru;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    iget-object v4, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    array-length v4, v4

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v3, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    array-length v4, v4

    invoke-static {v3, v5, v1, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v2, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    iput-object v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    :cond_5e
    iget v1, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    sub-int/2addr v1, v0

    if-eqz v1, :cond_7b

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    add-int/lit8 v3, v0, 0x1

    iget v4, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    sub-int/2addr v4, v0

    invoke-static {v1, v0, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    add-int/lit8 v3, v0, 0x1

    iget v4, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    sub-int/2addr v4, v0

    invoke-static {v1, v0, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_7b
    iget-object v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbcf:[I

    aput p1, v1, v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    aput-object p2, v1, v0

    iget v0, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzrt;->mSize:I

    goto :goto_b
.end method

.method public zzlA(I)Lcom/google/android/gms/internal/zzru;
    .registers 5

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzrt;->zzlC(I)I

    move-result v0

    if-ltz v0, :cond_e

    iget-object v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    aget-object v1, v1, v0

    sget-object v2, Lcom/google/android/gms/internal/zzrt;->zzbcd:Lcom/google/android/gms/internal/zzru;

    if-ne v1, v2, :cond_10

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return-object v0

    :cond_10
    iget-object v1, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    aget-object v0, v1, v0

    goto :goto_f
.end method

.method public zzlB(I)Lcom/google/android/gms/internal/zzru;
    .registers 3

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzrt;->zzbce:Z

    if-eqz v0, :cond_7

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzrt;->gc()V

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzrt;->zzbcg:[Lcom/google/android/gms/internal/zzru;

    aget-object v0, v0, p1

    return-object v0
.end method
