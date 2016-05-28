.class Lcom/google/android/gms/analytics/internal/zzah$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/analytics/internal/zzah;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zza"
.end annotation


# instance fields
.field private zzOt:I

.field private zzOu:Ljava/io/ByteArrayOutputStream;

.field final synthetic zzOv:Lcom/google/android/gms/analytics/internal/zzah;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/analytics/internal/zzah;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOv:Lcom/google/android/gms/analytics/internal/zzah;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOu:Ljava/io/ByteArrayOutputStream;

    return-void
.end method


# virtual methods
.method public getPayload()[B
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOu:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public zzj(Lcom/google/android/gms/analytics/internal/zzab;)Z
    .registers 7

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOt:I

    add-int/lit8 v0, v0, 0x1

    iget-object v3, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOv:Lcom/google/android/gms/analytics/internal/zzah;

    invoke-virtual {v3}, Lcom/google/android/gms/analytics/internal/zzah;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/analytics/internal/zzr;->zzjw()I

    move-result v3

    if-le v0, v3, :cond_17

    move v0, v1

    :goto_16
    return v0

    :cond_17
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOv:Lcom/google/android/gms/analytics/internal/zzah;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/analytics/internal/zzah;->zza(Lcom/google/android/gms/analytics/internal/zzab;Z)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2c

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOv:Lcom/google/android/gms/analytics/internal/zzah;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzah;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v1, "Error formatting hit"

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(Lcom/google/android/gms/analytics/internal/zzab;Ljava/lang/String;)V

    move v0, v2

    goto :goto_16

    :cond_2c
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v0, v3

    iget-object v4, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOv:Lcom/google/android/gms/analytics/internal/zzah;

    invoke-virtual {v4}, Lcom/google/android/gms/analytics/internal/zzah;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/analytics/internal/zzr;->zzjo()I

    move-result v4

    if-le v0, v4, :cond_4a

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOv:Lcom/google/android/gms/analytics/internal/zzah;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzah;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v1, "Hit size exceeds the maximum size limit"

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(Lcom/google/android/gms/analytics/internal/zzab;Ljava/lang/String;)V

    move v0, v2

    goto :goto_16

    :cond_4a
    iget-object v4, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOu:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4

    if-lez v4, :cond_54

    add-int/lit8 v0, v0, 0x1

    :cond_54
    iget-object v4, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOu:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4

    add-int/2addr v0, v4

    iget-object v4, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOv:Lcom/google/android/gms/analytics/internal/zzah;

    invoke-virtual {v4}, Lcom/google/android/gms/analytics/internal/zzah;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/analytics/internal/zzr;->zzjq()I

    move-result v4

    if-le v0, v4, :cond_69

    move v0, v1

    goto :goto_16

    :cond_69
    :try_start_69
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOu:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    if-lez v0, :cond_7a

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOu:Ljava/io/ByteArrayOutputStream;

    invoke-static {}, Lcom/google/android/gms/analytics/internal/zzah;->zzkw()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V

    :cond_7a
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOu:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_7f
    .catch Ljava/io/IOException; {:try_start_69 .. :try_end_7f} :catch_87

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOt:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOt:I

    move v0, v2

    goto :goto_16

    :catch_87
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOv:Lcom/google/android/gms/analytics/internal/zzah;

    const-string v3, "Failed to write payload when batching hits"

    invoke-virtual {v1, v3, v0}, Lcom/google/android/gms/analytics/internal/zzah;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    move v0, v2

    goto :goto_16
.end method

.method public zzkx()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzah$zza;->zzOt:I

    return v0
.end method
