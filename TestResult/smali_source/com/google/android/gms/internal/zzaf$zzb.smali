.class public final Lcom/google/android/gms/internal/zzaf$zzb;
.super Lcom/google/android/gms/internal/zzrr;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzb"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzrr",
        "<",
        "Lcom/google/android/gms/internal/zzaf$zzb;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile zzhP:[Lcom/google/android/gms/internal/zzaf$zzb;


# instance fields
.field public name:I

.field public zzhQ:[I

.field public zzhR:I

.field public zzhS:Z

.field public zzhT:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzrr;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaf$zzb;->zzD()Lcom/google/android/gms/internal/zzaf$zzb;

    return-void
.end method

.method public static zzC()[Lcom/google/android/gms/internal/zzaf$zzb;
    .registers 2

    sget-object v0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhP:[Lcom/google/android/gms/internal/zzaf$zzb;

    if-nez v0, :cond_11

    sget-object v1, Lcom/google/android/gms/internal/zzrv;->zzbck:Ljava/lang/Object;

    monitor-enter v1

    :try_start_7
    sget-object v0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhP:[Lcom/google/android/gms/internal/zzaf$zzb;

    if-nez v0, :cond_10

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzaf$zzb;

    sput-object v0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhP:[Lcom/google/android/gms/internal/zzaf$zzb;

    :cond_10
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_7 .. :try_end_11} :catchall_14

    :cond_11
    sget-object v0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhP:[Lcom/google/android/gms/internal/zzaf$zzb;

    return-object v0

    :catchall_14
    move-exception v0

    :try_start_15
    monitor-exit v1
    :try_end_16
    .catchall {:try_start_15 .. :try_end_16} :catchall_14

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    if-ne p1, p0, :cond_5

    const/4 v0, 0x1

    .end local p1    # "o":Ljava/lang/Object;
    :cond_4
    :goto_4
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_5
    instance-of v1, p1, Lcom/google/android/gms/internal/zzaf$zzb;

    if-eqz v1, :cond_4

    check-cast p1, Lcom/google/android/gms/internal/zzaf$zzb;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzrv;->equals([I[I)Z

    move-result v1

    if-eqz v1, :cond_4

    iget v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhR:I

    iget v2, p1, Lcom/google/android/gms/internal/zzaf$zzb;->zzhR:I

    if-ne v1, v2, :cond_4

    iget v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->name:I

    iget v2, p1, Lcom/google/android/gms/internal/zzaf$zzb;->name:I

    if-ne v1, v2, :cond_4

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhS:Z

    iget-boolean v2, p1, Lcom/google/android/gms/internal/zzaf$zzb;->zzhS:Z

    if-ne v1, v2, :cond_4

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhT:Z

    iget-boolean v2, p1, Lcom/google/android/gms/internal/zzaf$zzb;->zzhT:Z

    if-ne v1, v2, :cond_4

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaf$zzb;->zza(Lcom/google/android/gms/internal/zzrr;)Z

    move-result v0

    goto :goto_4
.end method

.method public hashCode()I
    .registers 5

    const/16 v2, 0x4d5

    const/16 v1, 0x4cf

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/zzrv;->hashCode([I)I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    iget v3, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhR:I

    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    iget v3, p0, Lcom/google/android/gms/internal/zzaf$zzb;->name:I

    add-int/2addr v0, v3

    mul-int/lit8 v3, v0, 0x1f

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhS:Z

    if-eqz v0, :cond_2d

    move v0, v1

    :goto_1d
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v3, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhT:Z

    if-eqz v3, :cond_2f

    :goto_24
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaf$zzb;->zzDk()I

    move-result v1

    add-int/2addr v0, v1

    return v0

    :cond_2d
    move v0, v2

    goto :goto_1d

    :cond_2f
    move v1, v2

    goto :goto_24
.end method

.method protected zzB()I
    .registers 5

    const/4 v1, 0x0

    invoke-super {p0}, Lcom/google/android/gms/internal/zzrr;->zzB()I

    move-result v0

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhT:Z

    if-eqz v2, :cond_11

    const/4 v2, 0x1

    iget-boolean v3, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhT:Z

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzrq;->zzc(IZ)I

    move-result v2

    add-int/2addr v0, v2

    :cond_11
    const/4 v2, 0x2

    iget v3, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhR:I

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzrq;->zzB(II)I

    move-result v2

    add-int/2addr v2, v0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    if-eqz v0, :cond_55

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    array-length v0, v0

    if-lez v0, :cond_55

    move v0, v1

    :goto_23
    iget-object v3, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    array-length v3, v3

    if-ge v0, v3, :cond_34

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    aget v3, v3, v0

    invoke-static {v3}, Lcom/google/android/gms/internal/zzrq;->zzls(I)I

    move-result v3

    add-int/2addr v1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    :cond_34
    add-int v0, v2, v1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x1

    add-int/2addr v0, v1

    :goto_3c
    iget v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->name:I

    if-eqz v1, :cond_48

    const/4 v1, 0x4

    iget v2, p0, Lcom/google/android/gms/internal/zzaf$zzb;->name:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzrq;->zzB(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_48
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhS:Z

    if-eqz v1, :cond_54

    const/4 v1, 0x6

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhS:Z

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzrq;->zzc(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_54
    return v0

    :cond_55
    move v0, v2

    goto :goto_3c
.end method

.method public zzD()Lcom/google/android/gms/internal/zzaf$zzb;
    .registers 3

    const/4 v1, 0x0

    sget-object v0, Lcom/google/android/gms/internal/zzsa;->zzbcn:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    iput v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhR:I

    iput v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->name:I

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhS:Z

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhT:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzbca:Lcom/google/android/gms/internal/zzrt;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzbcl:I

    return-object p0
.end method

.method public zza(Lcom/google/android/gms/internal/zzrq;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhT:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhT:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zzb(IZ)V

    :cond_a
    const/4 v0, 0x2

    iget v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhR:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zzz(II)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    array-length v0, v0

    if-lez v0, :cond_2a

    const/4 v0, 0x0

    :goto_1a
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    array-length v1, v1

    if-ge v0, v1, :cond_2a

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    aget v2, v2, v0

    invoke-virtual {p1, v1, v2}, Lcom/google/android/gms/internal/zzrq;->zzz(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_2a
    iget v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->name:I

    if-eqz v0, :cond_34

    const/4 v0, 0x4

    iget v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->name:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zzz(II)V

    :cond_34
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhS:Z

    if-eqz v0, :cond_3e

    const/4 v0, 0x6

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhS:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zzb(IZ)V

    :cond_3e
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzrr;->zza(Lcom/google/android/gms/internal/zzrq;)V

    return-void
.end method

.method public synthetic zzb(Lcom/google/android/gms/internal/zzrp;)Lcom/google/android/gms/internal/zzrx;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaf$zzb;->zzc(Lcom/google/android/gms/internal/zzrp;)Lcom/google/android/gms/internal/zzaf$zzb;

    move-result-object v0

    return-object v0
.end method

.method public zzc(Lcom/google/android/gms/internal/zzrp;)Lcom/google/android/gms/internal/zzaf$zzb;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    :cond_1
    :goto_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCT()I

    move-result v0

    sparse-switch v0, :sswitch_data_a2

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzaf$zzb;->zza(Lcom/google/android/gms/internal/zzrp;I)Z

    move-result v0

    if-nez v0, :cond_1

    :sswitch_e
    return-object p0

    :sswitch_f
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCX()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhT:Z

    goto :goto_1

    :sswitch_16
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCW()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhR:I

    goto :goto_1

    :sswitch_1d
    const/16 v0, 0x18

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzsa;->zzb(Lcom/google/android/gms/internal/zzrp;I)I

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    if-nez v0, :cond_43

    move v0, v1

    :goto_28
    add-int/2addr v2, v0

    new-array v2, v2, [I

    if-eqz v0, :cond_32

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_32
    :goto_32
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_47

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCW()I

    move-result v3

    aput v3, v2, v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCT()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_32

    :cond_43
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    array-length v0, v0

    goto :goto_28

    :cond_47
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCW()I

    move-result v3

    aput v3, v2, v0

    iput-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    goto :goto_1

    :sswitch_50
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzDa()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzrp;->zzll(I)I

    move-result v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->getPosition()I

    move-result v2

    move v0, v1

    :goto_5d
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzDf()I

    move-result v4

    if-lez v4, :cond_69

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCW()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_5d

    :cond_69
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/zzrp;->zzln(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    if-nez v2, :cond_87

    move v2, v1

    :goto_71
    add-int/2addr v0, v2

    new-array v0, v0, [I

    if-eqz v2, :cond_7b

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    invoke-static {v4, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_7b
    :goto_7b
    array-length v4, v0

    if-ge v2, v4, :cond_8b

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCW()I

    move-result v4

    aput v4, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_7b

    :cond_87
    iget-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    array-length v2, v2

    goto :goto_71

    :cond_8b
    iput-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhQ:[I

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/zzrp;->zzlm(I)V

    goto/16 :goto_1

    :sswitch_92
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCW()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->name:I

    goto/16 :goto_1

    :sswitch_9a
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCX()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaf$zzb;->zzhS:Z

    goto/16 :goto_1

    :sswitch_data_a2
    .sparse-switch
        0x0 -> :sswitch_e
        0x8 -> :sswitch_f
        0x10 -> :sswitch_16
        0x18 -> :sswitch_1d
        0x1a -> :sswitch_50
        0x20 -> :sswitch_92
        0x30 -> :sswitch_9a
    .end sparse-switch
.end method
