.class public final Lcom/google/android/gms/internal/zzaf$zzi;
.super Lcom/google/android/gms/internal/zzrr;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzi"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzrr",
        "<",
        "Lcom/google/android/gms/internal/zzaf$zzi;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile zziN:[Lcom/google/android/gms/internal/zzaf$zzi;


# instance fields
.field public name:Ljava/lang/String;

.field public zziO:Lcom/google/android/gms/internal/zzag$zza;

.field public zziP:Lcom/google/android/gms/internal/zzaf$zzd;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzrr;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaf$zzi;->zzO()Lcom/google/android/gms/internal/zzaf$zzi;

    return-void
.end method

.method public static zzN()[Lcom/google/android/gms/internal/zzaf$zzi;
    .registers 2

    sget-object v0, Lcom/google/android/gms/internal/zzaf$zzi;->zziN:[Lcom/google/android/gms/internal/zzaf$zzi;

    if-nez v0, :cond_11

    sget-object v1, Lcom/google/android/gms/internal/zzrv;->zzbck:Ljava/lang/Object;

    monitor-enter v1

    :try_start_7
    sget-object v0, Lcom/google/android/gms/internal/zzaf$zzi;->zziN:[Lcom/google/android/gms/internal/zzaf$zzi;

    if-nez v0, :cond_10

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzaf$zzi;

    sput-object v0, Lcom/google/android/gms/internal/zzaf$zzi;->zziN:[Lcom/google/android/gms/internal/zzaf$zzi;

    :cond_10
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_7 .. :try_end_11} :catchall_14

    :cond_11
    sget-object v0, Lcom/google/android/gms/internal/zzaf$zzi;->zziN:[Lcom/google/android/gms/internal/zzaf$zzi;

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
    instance-of v1, p1, Lcom/google/android/gms/internal/zzaf$zzi;

    if-eqz v1, :cond_4

    check-cast p1, Lcom/google/android/gms/internal/zzaf$zzi;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->name:Ljava/lang/String;

    if-nez v1, :cond_28

    iget-object v1, p1, Lcom/google/android/gms/internal/zzaf$zzi;->name:Ljava/lang/String;

    if-nez v1, :cond_4

    :cond_13
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    if-nez v1, :cond_33

    iget-object v1, p1, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    if-nez v1, :cond_4

    :cond_1b
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    if-nez v1, :cond_3e

    iget-object v1, p1, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    if-nez v1, :cond_4

    :cond_23
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaf$zzi;->zza(Lcom/google/android/gms/internal/zzrr;)Z

    move-result v0

    goto :goto_4

    :cond_28
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->name:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/zzaf$zzi;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    goto :goto_4

    :cond_33
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    iget-object v2, p1, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzag$zza;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b

    goto :goto_4

    :cond_3e
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    iget-object v2, p1, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzaf$zzd;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_23

    goto :goto_4
.end method

.method public hashCode()I
    .registers 4

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->name:Ljava/lang/String;

    if-nez v0, :cond_1f

    move v0, v1

    :goto_6
    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    if-nez v0, :cond_26

    move v0, v1

    :goto_f
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    if-nez v2, :cond_2d

    :goto_16
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaf$zzi;->zzDk()I

    move-result v1

    add-int/2addr v0, v1

    return v0

    :cond_1f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_6

    :cond_26
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzag$zza;->hashCode()I

    move-result v0

    goto :goto_f

    :cond_2d
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzaf$zzd;->hashCode()I

    move-result v1

    goto :goto_16
.end method

.method protected zzB()I
    .registers 4

    invoke-super {p0}, Lcom/google/android/gms/internal/zzrr;->zzB()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->name:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzi;->name:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzrq;->zzl(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_16
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    if-eqz v1, :cond_22

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzrq;->zzc(ILcom/google/android/gms/internal/zzrx;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_22
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    if-eqz v1, :cond_2e

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzrq;->zzc(ILcom/google/android/gms/internal/zzrx;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2e
    return v0
.end method

.method public zzO()Lcom/google/android/gms/internal/zzaf$zzi;
    .registers 3

    const/4 v1, 0x0

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->name:Ljava/lang/String;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zzbca:Lcom/google/android/gms/internal/zzrt;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zzbcl:I

    return-object p0
.end method

.method public zza(Lcom/google/android/gms/internal/zzrq;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->name:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->name:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zzb(ILjava/lang/String;)V

    :cond_10
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    if-eqz v0, :cond_1a

    const/4 v0, 0x2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zza(ILcom/google/android/gms/internal/zzrx;)V

    :cond_1a
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    if-eqz v0, :cond_24

    const/4 v0, 0x3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzrq;->zza(ILcom/google/android/gms/internal/zzrx;)V

    :cond_24
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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaf$zzi;->zzj(Lcom/google/android/gms/internal/zzrp;)Lcom/google/android/gms/internal/zzaf$zzi;

    move-result-object v0

    return-object v0
.end method

.method public zzj(Lcom/google/android/gms/internal/zzrp;)Lcom/google/android/gms/internal/zzaf$zzi;
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

    sparse-switch v0, :sswitch_data_38

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzaf$zzi;->zza(Lcom/google/android/gms/internal/zzrp;I)Z

    move-result v0

    if-nez v0, :cond_0

    :sswitch_d
    return-object p0

    :sswitch_e
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzrp;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->name:Ljava/lang/String;

    goto :goto_0

    :sswitch_15
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    if-nez v0, :cond_20

    new-instance v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzag$zza;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    :cond_20
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziO:Lcom/google/android/gms/internal/zzag$zza;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzrp;->zza(Lcom/google/android/gms/internal/zzrx;)V

    goto :goto_0

    :sswitch_26
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    if-nez v0, :cond_31

    new-instance v0, Lcom/google/android/gms/internal/zzaf$zzd;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaf$zzd;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    :cond_31
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaf$zzi;->zziP:Lcom/google/android/gms/internal/zzaf$zzd;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzrp;->zza(Lcom/google/android/gms/internal/zzrx;)V

    goto :goto_0

    nop

    :sswitch_data_38
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_e
        0x12 -> :sswitch_15
        0x1a -> :sswitch_26
    .end sparse-switch
.end method
