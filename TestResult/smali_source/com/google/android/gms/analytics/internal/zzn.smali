.class public Lcom/google/android/gms/analytics/internal/zzn;
.super Lcom/google/android/gms/analytics/internal/zzd;


# instance fields
.field private volatile zzLd:Ljava/lang/String;

.field private zzMG:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzd;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/analytics/internal/zzn;)Ljava/lang/String;
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzn;->zzjg()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private zzg(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 7

    const/4 v0, 0x0

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "ClientId should be saved from worker thread"

    invoke-static {v1}, Lcom/google/android/gms/common/internal/zzx;->zzci(Ljava/lang/String;)V

    const/4 v2, 0x0

    :try_start_a
    const-string v1, "Storing clientId"

    invoke-virtual {p0, v1, p2}, Lcom/google/android/gms/analytics/internal/zzn;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "gaClientId"

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v3}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1d
    .catch Ljava/io/FileNotFoundException; {:try_start_a .. :try_end_1d} :catch_2b
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_1d} :catch_3e
    .catchall {:try_start_a .. :try_end_1d} :catchall_51

    const/4 v0, 0x1

    if-eqz v2, :cond_23

    :try_start_20
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_23} :catch_24

    :cond_23
    :goto_23
    return v0

    :catch_24
    move-exception v1

    const-string v2, "Failed to close clientId writing stream"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_23

    :catch_2b
    move-exception v1

    :try_start_2c
    const-string v3, "Error creating clientId file"

    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_31
    .catchall {:try_start_2c .. :try_end_31} :catchall_51

    if-eqz v2, :cond_23

    :try_start_33
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_36} :catch_37

    goto :goto_23

    :catch_37
    move-exception v1

    const-string v2, "Failed to close clientId writing stream"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_23

    :catch_3e
    move-exception v1

    :try_start_3f
    const-string v3, "Error writing to clientId file"

    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_44
    .catchall {:try_start_3f .. :try_end_44} :catchall_51

    if-eqz v2, :cond_23

    :try_start_46
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_49
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_49} :catch_4a

    goto :goto_23

    :catch_4a
    move-exception v1

    const-string v2, "Failed to close clientId writing stream"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_23

    :catchall_51
    move-exception v0

    if-eqz v2, :cond_57

    :try_start_54
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_57
    .catch Ljava/io/IOException; {:try_start_54 .. :try_end_57} :catch_58

    :cond_57
    :goto_57
    throw v0

    :catch_58
    move-exception v1

    const-string v2, "Failed to close clientId writing stream"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_57
.end method

.method private zzjg()Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzn;->zzjh()Ljava/lang/String;

    move-result-object v0

    :try_start_4
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzn;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzof;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzn;->zzg(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_14

    const-string v0, "0"
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_14} :catch_15

    :cond_14
    :goto_14
    return-object v0

    :catch_15
    move-exception v0

    const-string v1, "Error saving clientId file"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "0"

    goto :goto_14
.end method


# virtual methods
.method protected zzZ(Landroid/content/Context;)Ljava/lang/String;
    .registers 8

    const/4 v0, 0x0

    const-string v1, "ClientId should be loaded from worker thread"

    invoke-static {v1}, Lcom/google/android/gms/common/internal/zzx;->zzci(Ljava/lang/String;)V

    :try_start_6
    const-string v1, "gaClientId"

    invoke-virtual {p1, v1}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;
    :try_end_b
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_b} :catch_70
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_b} :catch_7f
    .catchall {:try_start_6 .. :try_end_b} :catchall_98

    move-result-object v2

    const/16 v1, 0x24

    :try_start_e
    new-array v3, v1, [B

    const/4 v1, 0x0

    array-length v4, v3

    invoke-virtual {v2, v3, v1, v4}, Ljava/io/FileInputStream;->read([BII)I

    move-result v4

    invoke-virtual {v2}, Ljava/io/FileInputStream;->available()I

    move-result v1

    if-lez v1, :cond_36

    const-string v1, "clientId file seems corrupted, deleting it."

    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zzbb(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    const-string v1, "gaClientId"

    invoke-virtual {p1, v1}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_29
    .catch Ljava/io/FileNotFoundException; {:try_start_e .. :try_end_29} :catch_ac
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_29} :catch_aa
    .catchall {:try_start_e .. :try_end_29} :catchall_a8

    if-eqz v2, :cond_2e

    :try_start_2b
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_2e} :catch_2f

    :cond_2e
    :goto_2e
    return-object v0

    :catch_2f
    move-exception v1

    const-string v2, "Failed to close client id reading stream"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2e

    :cond_36
    const/16 v1, 0xe

    if-ge v4, v1, :cond_54

    :try_start_3a
    const-string v1, "clientId file is empty, deleting it."

    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zzbb(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    const-string v1, "gaClientId"

    invoke-virtual {p1, v1}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_47
    .catch Ljava/io/FileNotFoundException; {:try_start_3a .. :try_end_47} :catch_ac
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_47} :catch_aa
    .catchall {:try_start_3a .. :try_end_47} :catchall_a8

    if-eqz v2, :cond_2e

    :try_start_49
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_4c
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_4c} :catch_4d

    goto :goto_2e

    :catch_4d
    move-exception v1

    const-string v2, "Failed to close client id reading stream"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2e

    :cond_54
    :try_start_54
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    new-instance v1, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {v1, v3, v5, v4}, Ljava/lang/String;-><init>([BII)V

    const-string v3, "Read client id from disk"

    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zza(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_62
    .catch Ljava/io/FileNotFoundException; {:try_start_54 .. :try_end_62} :catch_ac
    .catch Ljava/io/IOException; {:try_start_54 .. :try_end_62} :catch_aa
    .catchall {:try_start_54 .. :try_end_62} :catchall_a8

    if-eqz v2, :cond_67

    :try_start_64
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_67} :catch_69

    :cond_67
    :goto_67
    move-object v0, v1

    goto :goto_2e

    :catch_69
    move-exception v0

    const-string v2, "Failed to close client id reading stream"

    invoke-virtual {p0, v2, v0}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_67

    :catch_70
    move-exception v1

    move-object v1, v0

    :goto_72
    if-eqz v1, :cond_2e

    :try_start_74
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_77
    .catch Ljava/io/IOException; {:try_start_74 .. :try_end_77} :catch_78

    goto :goto_2e

    :catch_78
    move-exception v1

    const-string v2, "Failed to close client id reading stream"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2e

    :catch_7f
    move-exception v1

    move-object v2, v0

    :goto_81
    :try_start_81
    const-string v3, "Error reading client id file, deleting it"

    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "gaClientId"

    invoke-virtual {p1, v1}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_8b
    .catchall {:try_start_81 .. :try_end_8b} :catchall_a8

    if-eqz v2, :cond_2e

    :try_start_8d
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_90
    .catch Ljava/io/IOException; {:try_start_8d .. :try_end_90} :catch_91

    goto :goto_2e

    :catch_91
    move-exception v1

    const-string v2, "Failed to close client id reading stream"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2e

    :catchall_98
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    :goto_9b
    if-eqz v2, :cond_a0

    :try_start_9d
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_a0
    .catch Ljava/io/IOException; {:try_start_9d .. :try_end_a0} :catch_a1

    :cond_a0
    :goto_a0
    throw v0

    :catch_a1
    move-exception v1

    const-string v2, "Failed to close client id reading stream"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_a0

    :catchall_a8
    move-exception v0

    goto :goto_9b

    :catch_aa
    move-exception v1

    goto :goto_81

    :catch_ac
    move-exception v1

    move-object v1, v2

    goto :goto_72
.end method

.method protected zzhB()V
    .registers 1

    return-void
.end method

.method public zzjd()Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzn;->zzio()V

    monitor-enter p0

    :try_start_4
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzLd:Ljava/lang/String;

    if-nez v0, :cond_17

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzn;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/analytics/internal/zzn$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/analytics/internal/zzn$1;-><init>(Lcom/google/android/gms/analytics/internal/zzn;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzof;->zzb(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzMG:Ljava/util/concurrent/Future;

    :cond_17
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzMG:Ljava/util/concurrent/Future;
    :try_end_19
    .catchall {:try_start_4 .. :try_end_19} :catchall_46

    if-eqz v0, :cond_37

    :try_start_1b
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzMG:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzLd:Ljava/lang/String;
    :try_end_25
    .catch Ljava/lang/InterruptedException; {:try_start_1b .. :try_end_25} :catch_3b
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1b .. :try_end_25} :catch_49
    .catchall {:try_start_1b .. :try_end_25} :catchall_46

    :goto_25
    :try_start_25
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzLd:Ljava/lang/String;

    if-nez v0, :cond_2d

    const-string v0, "0"

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzLd:Ljava/lang/String;

    :cond_2d
    const-string v0, "Loaded clientId"

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzLd:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/analytics/internal/zzn;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzMG:Ljava/util/concurrent/Future;

    :cond_37
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzLd:Ljava/lang/String;

    monitor-exit p0

    return-object v0

    :catch_3b
    move-exception v0

    const-string v1, "ClientId loading or generation was interrupted"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzn;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "0"

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzLd:Ljava/lang/String;

    goto :goto_25

    :catchall_46
    move-exception v0

    monitor-exit p0
    :try_end_48
    .catchall {:try_start_25 .. :try_end_48} :catchall_46

    throw v0

    :catch_49
    move-exception v0

    :try_start_4a
    const-string v1, "Failed to load or generate client id"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzn;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "0"

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzLd:Ljava/lang/String;
    :try_end_53
    .catchall {:try_start_4a .. :try_end_53} :catchall_46

    goto :goto_25
.end method

.method zzje()Ljava/lang/String;
    .registers 3

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzLd:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzn;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/analytics/internal/zzn$2;

    invoke-direct {v1, p0}, Lcom/google/android/gms/analytics/internal/zzn$2;-><init>(Lcom/google/android/gms/analytics/internal/zzn;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzof;->zzb(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzn;->zzMG:Ljava/util/concurrent/Future;

    monitor-exit p0
    :try_end_14
    .catchall {:try_start_2 .. :try_end_14} :catchall_19

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzn;->zzjd()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :catchall_19
    move-exception v0

    :try_start_1a
    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_19

    throw v0
.end method

.method zzjf()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzn;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzof;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzn;->zzZ(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_12

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzn;->zzjg()Ljava/lang/String;

    move-result-object v0

    :cond_12
    return-object v0
.end method

.method protected zzjh()Ljava/lang/String;
    .registers 2

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
