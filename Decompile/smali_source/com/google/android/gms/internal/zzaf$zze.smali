.class public final Lcom/google/android/gms/internal/zzaf$zze;
.super Lcom/google/android/gms/internal/zzrr;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zze"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzrr",
        "<",
        "Lcom/google/android/gms/internal/zzaf$zze;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile zzic:[Lcom/google/android/gms/internal/zzaf$zze;


# instance fields
.field public key:I

.field public value:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzrr;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaf$zze;->zzI()Lcom/google/android/gms/internal/zzaf$zze;

    return-void
.end method

.method public static zzH()[Lcom/google/android/gms/internal/zzaf$zze;
    .registers 2

    sget-object v0, Lcom/google/android/gms/internal/zzaf$zze;->zzic:[Lcom/google/android/gms/internal/zzaf$zze;

    if-nez v0, :cond_11

    sget-object v1, Lcom/google/android/gms/internal/zzrv;->zzbck:Ljava/lang/Object;

    monitor-enter v1

    :try_start_7
    sget-object v0, Lcom/google/android/gms/internal/zzaf$zze;->zzic:[Lcom/google/android/gms/internal/zzaf$zze;

    if-nez v0, :cond_10

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzaf$zze;

    sput-object v0, Lcom/google/android/gms/internal/zzaf$zze;->zzic:[Lcom/google/android/gms/internal/zzaf$zze;

    :cond_10
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_7 .. :try_end_11} :catchall_14

    :cond_11
    sget-object v0, Lcom/google/android/gms/internal/zzaf$zze;->zzic:[Lcom/google/android/gms/internal/zzaf$zze;

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
    instance-of v1, p1, Lcom/google/android/gms/internal/zzaf$zze;

    if-eqz v1, :cond_4

    check-cast p1, Lcom/google/android/gms/internal/zzaf$zze;

    .end local p1    # "o":Ljava/lang/Object;
    iget v1, p0, Lcom/google/android/gms/internal/zzaf$zze;->key:I

    iget v2, p1, Lcom/google/android/gms/internal/zzaf$zze;->key:I

    if-ne v1, v2, :cond_4

    iget v1, p0, Lcom/google/android/gms/internal/zzaf$zze;->value:I

    iget v2, p1, Lcom/google/android/gms/internal/zzaf$zze;->value:I

    if-ne v1, v2, :cond_4

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaf$zze;->zza(Lcom/google/android/gms/internal/zzrr;)Z

    move-result v0

    goto :goto_4
.end method

.method public hashCode()I
    .registers 3

    iget v0, p0, Lcom/google/android/gms/internal/zzaf$zze;->key:I

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/android/gms/internal/zzaf$zze;->value:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaf$zze;->zzDk()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method protected zzB()I
    .registers 4

    invoke-super {p0}, Lcom/google/android/gms/internal/zzrr;->zzB()I

    move-result v0

    const/4 v1, 0x1

    iget v2, p0, Lcom/google/android/gms/internal/zzaf$zze;->key:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzrq;->zzB(II)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x2

    iget v2, p0, Lcom/google/android/gms/internal/zzaf$zze;->value:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzrq;->zzB(II)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public zzI()Lcom/google/android/gms/internal/zzaf$zze;
    .registers 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/zzaf$zze;->key:I

    iput v0, p0, Lcom/google/android/gms/internal/zzaf$zze;->value:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaf$zze;->zzbca:Lcom/google/android/gms/internal/zzrt;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzaf$zze;->zzbcl:I

    return-object p0
.end method

.method public zza(Lcom/google/android/gms/internal/zzrq;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    iget v1, p0, Lcom/google/android/gms/internal/zzaf$zze;->key:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zzz(II)V

    const/4 v0, 0x2

    iget v1, p0, Lcom/google/android/gms/internal/zzaf$zze;->value:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zzz(II)V

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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaf$zze;->zzf(Lcom/google/android/gms/internal/zzrp;)Lcom/google/android/gms/internal/zzaf$zze;

    move-result-object v0

    return-object v0
.end method

.method public zzf(Lcom/google/android/gms/internal/zzrp;)Lcom/google/android/gms/internal/zzaf$zze;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCT()I

    move-result v0

    sparse-switch v0, :sswitch_data_1c

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzaf$zze;->zza(Lcom/google/android/gms/internal/zzrp;I)Z

    move-result v0

    if-nez v0, :cond_0

    :sswitch_d
    return-object p0

    :sswitch_e
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCW()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzaf$zze;->key:I

    goto :goto_0

    :sswitch_15
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->zzCW()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzaf$zze;->value:I

    goto :goto_0

    :sswitch_data_1c
    .sparse-switch
        0x0 -> :sswitch_d
        0x8 -> :sswitch_e
        0x10 -> :sswitch_15
    .end sparse-switch
.end method
