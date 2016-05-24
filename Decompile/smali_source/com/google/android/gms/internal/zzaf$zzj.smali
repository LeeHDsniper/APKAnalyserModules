.class public final Lcom/google/android/gms/internal/zzaf$zzj;
.super Lcom/google/android/gms/internal/zzrr;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzj"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzrr",
        "<",
        "Lcom/google/android/gms/internal/zzaf$zzj;",
        ">;"
    }
.end annotation


# instance fields
.field public zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

.field public zziR:Lcom/google/android/gms/internal/zzaf$zzf;

.field public zziS:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzrr;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaf$zzj;->zzP()Lcom/google/android/gms/internal/zzaf$zzj;

    return-void
.end method

.method public static zzd([B)Lcom/google/android/gms/internal/zzaf$zzj;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzrw;
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzaf$zzj;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaf$zzj;-><init>()V

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/zzrx;->zza(Lcom/google/android/gms/internal/zzrx;[B)Lcom/google/android/gms/internal/zzrx;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaf$zzj;

    return-object v0
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
    instance-of v1, p1, Lcom/google/android/gms/internal/zzaf$zzj;

    if-eqz v1, :cond_4

    check-cast p1, Lcom/google/android/gms/internal/zzaf$zzj;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    iget-object v2, p1, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzrv;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    if-nez v1, :cond_2a

    iget-object v1, p1, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    if-nez v1, :cond_4

    :cond_1d
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    if-nez v1, :cond_35

    iget-object v1, p1, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    if-nez v1, :cond_4

    :cond_25
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaf$zzj;->zza(Lcom/google/android/gms/internal/zzrr;)Z

    move-result v0

    goto :goto_4

    :cond_2a
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    iget-object v2, p1, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzaf$zzf;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1d

    goto :goto_4

    :cond_35
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_25

    goto :goto_4
.end method

.method public hashCode()I
    .registers 4

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzrv;->hashCode([Ljava/lang/Object;)I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    if-nez v0, :cond_20

    move v0, v1

    :goto_10
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    if-nez v2, :cond_27

    :goto_17
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaf$zzj;->zzDk()I

    move-result v1

    add-int/2addr v0, v1

    return v0

    :cond_20
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaf$zzf;->hashCode()I

    move-result v0

    goto :goto_10

    :cond_27
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_17
.end method

.method protected zzB()I
    .registers 5

    invoke-super {p0}, Lcom/google/android/gms/internal/zzrr;->zzB()I

    move-result v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    array-length v0, v0

    if-lez v0, :cond_22

    const/4 v0, 0x0

    :goto_e
    iget-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    array-length v2, v2

    if-ge v0, v2, :cond_22

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    aget-object v2, v2, v0

    if-eqz v2, :cond_1f

    const/4 v3, 0x1

    invoke-static {v3, v2}, Lcom/google/android/gms/internal/zzrq;->zzc(ILcom/google/android/gms/internal/zzrx;)I

    move-result v2

    add-int/2addr v1, v2

    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_22
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    if-eqz v0, :cond_2e

    const/4 v0, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzrq;->zzc(ILcom/google/android/gms/internal/zzrx;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_2e
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_40

    const/4 v0, 0x3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzrq;->zzl(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_40
    return v1
.end method

.method public zzP()Lcom/google/android/gms/internal/zzaf$zzj;
    .registers 3

    const/4 v1, 0x0

    invoke-static {}, Lcom/google/android/gms/internal/zzaf$zzi;->zzN()[Lcom/google/android/gms/internal/zzaf$zzi;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zzbca:Lcom/google/android/gms/internal/zzrt;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zzbcl:I

    return-object p0
.end method

.method public zza(Lcom/google/android/gms/internal/zzrq;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    array-length v0, v0

    if-lez v0, :cond_1c

    const/4 v0, 0x0

    :goto_a
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    array-length v1, v1

    if-ge v0, v1, :cond_1c

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    aget-object v1, v1, v0

    if-eqz v1, :cond_19

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v1}, Lcom/google/android/gms/internal/zzrq;->zza(ILcom/google/android/gms/internal/zzrx;)V

    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    :cond_1c
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    if-eqz v0, :cond_26

    const/4 v0, 0x2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zza(ILcom/google/android/gms/internal/zzrx;)V

    :cond_26
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_36

    const/4 v0, 0x3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zzb(ILjava/lang/String;)V

    :cond_36
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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaf$zzj;->zzk(Lcom/google/android/gms/internal/zzrp;)Lcom/google/android/gms/internal/zzaf$zzj;

    move-result-object v0

    return-object v0
.end method

.method public zzk(Lcom/google/android/gms/internal/zzrp;)Lcom/google/android/gms/internal/zzaf$zzj;
    .registers 6
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

    sparse-switch v0, :sswitch_data_66

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzaf$zzj;->zza(Lcom/google/android/gms/internal/zzrp;I)Z

    move-result v0

    if-nez v0, :cond_1

    :sswitch_e
    return-object p0

    :sswitch_f
    const/16 v0, 0xa

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzsa;->zzb(Lcom/google/android/gms/internal/zzrp;I)I

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    if-nez v0, :cond_3b

    move v0, v1

    :goto_1a
    add-int/2addr v2, v0

    new-array v2, v2, [Lcom/google/android/gms/internal/zzaf$zzi;

    if-eqz v0, :cond_24

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_24
    :goto_24
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_3f

    new-instance v3, Lcom/google/android/gms/internal/zzaf$zzi;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzaf$zzi;-><init>()V

    aput-object v3, v2, v0

    aget-object v3, v2, v0

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/zzrp;->zza(Lcom/google/android/gms/internal/zzrx;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCT()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_24

    :cond_3b
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    array-length v0, v0

    goto :goto_1a

    :cond_3f
    new-instance v3, Lcom/google/android/gms/internal/zzaf$zzi;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzaf$zzi;-><init>()V

    aput-object v3, v2, v0

    aget-object v0, v2, v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzrp;->zza(Lcom/google/android/gms/internal/zzrx;)V

    iput-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziQ:[Lcom/google/android/gms/internal/zzaf$zzi;

    goto :goto_1

    :sswitch_4e
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    if-nez v0, :cond_59

    new-instance v0, Lcom/google/android/gms/internal/zzaf$zzf;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaf$zzf;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    :cond_59
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziR:Lcom/google/android/gms/internal/zzaf$zzf;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzrp;->zza(Lcom/google/android/gms/internal/zzrx;)V

    goto :goto_1

    :sswitch_5f
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    goto :goto_1

    :sswitch_data_66
    .sparse-switch
        0x0 -> :sswitch_e
        0xa -> :sswitch_f
        0x12 -> :sswitch_4e
        0x1a -> :sswitch_5f
    .end sparse-switch
.end method
