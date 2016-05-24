.class public Lcom/google/android/gms/analytics/internal/zza;
.super Lcom/google/android/gms/analytics/internal/zzd;


# static fields
.field public static zzLk:Z


# instance fields
.field private zzLl:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

.field private final zzLm:Lcom/google/android/gms/analytics/internal/zzaj;

.field private zzLn:Ljava/lang/String;

.field private zzLo:Z

.field private zzLp:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 4

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzd;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLo:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLp:Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzaj;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzf;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/analytics/internal/zzaj;-><init>(Lcom/google/android/gms/internal/zzlm;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLm:Lcom/google/android/gms/analytics/internal/zzaj;

    return-void
.end method

.method private zza(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;)Z
    .registers 9

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez p2, :cond_d

    move-object v0, v1

    :goto_5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_12

    move v0, v2

    :goto_c
    return v0

    :cond_d
    invoke-virtual {p2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :cond_12
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zza;->zzij()Lcom/google/android/gms/analytics/internal/zzn;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/analytics/internal/zzn;->zzjd()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLp:Ljava/lang/Object;

    monitor-enter v4

    :try_start_1d
    iget-boolean v5, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLo:Z

    if-nez v5, :cond_4b

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zza;->zzhT()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLn:Ljava/lang/String;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLo:Z

    :cond_2a
    :goto_2a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/analytics/internal/zza;->zzaW(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_8b

    const/4 v0, 0x0

    monitor-exit v4

    goto :goto_c

    :catchall_48
    move-exception v0

    monitor-exit v4
    :try_end_4a
    .catchall {:try_start_1d .. :try_end_4a} :catchall_48

    throw v0

    :cond_4b
    :try_start_4b
    iget-object v5, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLn:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2a

    if-nez p1, :cond_6e

    :goto_55
    if-nez v1, :cond_73

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zza;->zzaX(Ljava/lang/String;)Z

    move-result v0

    monitor-exit v4

    goto :goto_c

    :cond_6e
    invoke-virtual {p1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v1

    goto :goto_55

    :cond_73
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/analytics/internal/zza;->zzaW(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLn:Ljava/lang/String;

    goto :goto_2a

    :cond_8b
    iget-object v5, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLn:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_97

    monitor-exit v4

    move v0, v2

    goto/16 :goto_c

    :cond_97
    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLn:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_c9

    const-string v1, "Resetting the client id because Advertising Id changed."

    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/internal/zza;->zzaY(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zza;->zzij()Lcom/google/android/gms/analytics/internal/zzn;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzn;->zzje()Ljava/lang/String;

    move-result-object v1

    const-string v2, "New client Id"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zza;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_b1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zza;->zzaX(Ljava/lang/String;)Z

    move-result v0

    monitor-exit v4
    :try_end_c7
    .catchall {:try_start_4b .. :try_end_c7} :catchall_48

    goto/16 :goto_c

    :cond_c9
    move-object v1, v3

    goto :goto_b1
.end method

.method private static zzaW(Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    const/4 v7, 0x1

    const-string v0, "MD5"

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzam;->zzbq(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    if-nez v0, :cond_b

    const/4 v0, 0x0

    :goto_a
    return-object v0

    :cond_b
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%032X"

    new-array v3, v7, [Ljava/lang/Object;

    const/4 v4, 0x0

    new-instance v5, Ljava/math/BigInteger;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    invoke-direct {v5, v7, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method private zzaX(Ljava/lang/String;)Z
    .registers 7

    const/4 v0, 0x0

    :try_start_1
    invoke-static {p1}, Lcom/google/android/gms/analytics/internal/zza;->zzaW(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Storing hashed adid."

    invoke-virtual {p0, v2}, Lcom/google/android/gms/analytics/internal/zza;->zzaY(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zza;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "gaClientIdData"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLn:Ljava/lang/String;
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_21} :catch_23

    const/4 v0, 0x1

    :goto_22
    return v0

    :catch_23
    move-exception v1

    const-string v2, "Error creating hash file"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zza;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_22
.end method

.method private declared-synchronized zzhR()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    .registers 5

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLm:Lcom/google/android/gms/analytics/internal/zzaj;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzaj;->zzv(J)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLm:Lcom/google/android/gms/analytics/internal/zzaj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzaj;->start()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zza;->zzhS()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLl:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    invoke-direct {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zza;->zza(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;)Z

    move-result v1

    if-eqz v1, :cond_22

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLl:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    :cond_1e
    :goto_1e
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLl:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_32

    monitor-exit p0

    return-object v0

    :cond_22
    :try_start_22
    const-string v0, "Failed to reset client id on adid change. Not using adid"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zza;->zzbc(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    const-string v1, ""

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zza;->zzLl:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    :try_end_31
    .catchall {:try_start_22 .. :try_end_31} :catchall_32

    goto :goto_1e

    :catchall_32
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method protected zzhB()V
    .registers 1

    return-void
.end method

.method public zzhM()Z
    .registers 3

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zza;->zzio()V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zza;->zzhR()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v1

    if-eqz v1, :cond_11

    invoke-virtual {v1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result v1

    if-nez v1, :cond_11

    const/4 v0, 0x1

    :cond_11
    return v0
.end method

.method public zzhQ()Ljava/lang/String;
    .registers 4

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zza;->zzio()V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zza;->zzhR()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v0

    if-eqz v0, :cond_17

    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v0

    :goto_e
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_15

    :goto_14
    return-object v1

    :cond_15
    move-object v1, v0

    goto :goto_14

    :cond_17
    move-object v0, v1

    goto :goto_e
.end method

.method protected zzhS()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    .registers 4

    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zza;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    :try_end_8
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_8} :catch_a
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_8} :catch_11

    move-result-object v0

    :cond_9
    :goto_9
    return-object v0

    :catch_a
    move-exception v1

    const-string v1, "IllegalStateException getting Ad Id Info. If you would like to see Audience reports, please ensure that you have added \'<meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />\' to your application manifest file. See http://goo.gl/naFqQk for details."

    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/internal/zza;->zzbb(Ljava/lang/String;)V

    goto :goto_9

    :catch_11
    move-exception v1

    sget-boolean v2, Lcom/google/android/gms/analytics/internal/zza;->zzLk:Z

    if-nez v2, :cond_9

    const/4 v2, 0x1

    sput-boolean v2, Lcom/google/android/gms/analytics/internal/zza;->zzLk:Z

    const-string v2, "Error getting advertiser id"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zza;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_9
.end method

.method protected zzhT()Ljava/lang/String;
    .registers 8

    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zza;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "gaClientIdData"

    invoke-virtual {v1, v2}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v2

    const/16 v1, 0x80

    new-array v3, v1, [B

    const/4 v1, 0x0

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v1, v4}, Ljava/io/FileInputStream;->read([BII)I

    move-result v4

    invoke-virtual {v2}, Ljava/io/FileInputStream;->available()I

    move-result v1

    if-lez v1, :cond_2e

    const-string v1, "Hash file seems corrupted, deleting it."

    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/internal/zza;->zzbb(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zza;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "gaClientIdData"

    invoke-virtual {v1, v2}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    :goto_2d
    return-object v0

    :cond_2e
    if-gtz v4, :cond_3b

    const-string v1, "Hash file is empty."

    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/internal/zza;->zzaY(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    goto :goto_2d

    :catch_39
    move-exception v1

    goto :goto_2d

    :cond_3b
    new-instance v1, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {v1, v3, v5, v4}, Ljava/lang/String;-><init>([BII)V
    :try_end_41
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_41} :catch_39
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_41} :catch_46

    :try_start_41
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_44
    .catch Ljava/io/FileNotFoundException; {:try_start_41 .. :try_end_44} :catch_5b
    .catch Ljava/io/IOException; {:try_start_41 .. :try_end_44} :catch_56

    move-object v0, v1

    goto :goto_2d

    :catch_46
    move-exception v1

    :goto_47
    const-string v2, "Error reading Hash file, deleting it"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zza;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zza;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "gaClientIdData"

    invoke-virtual {v1, v2}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    goto :goto_2d

    :catch_56
    move-exception v0

    move-object v6, v0

    move-object v0, v1

    move-object v1, v6

    goto :goto_47

    :catch_5b
    move-exception v0

    move-object v0, v1

    goto :goto_2d
.end method
