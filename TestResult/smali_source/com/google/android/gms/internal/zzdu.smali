.class public Lcom/google/android/gms/internal/zzdu;
.super Lcom/google/android/gms/internal/zzdr;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# static fields
.field private static final zzxB:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final zzxC:Ljava/text/DecimalFormat;


# instance fields
.field private zzxD:Ljava/io/File;

.field private zzxE:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzdu;->zzxB:Ljava/util/Set;

    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "#,###"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/zzdu;->zzxC:Ljava/text/DecimalFormat;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzip;)V
    .registers 8

    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzdr;-><init>(Lcom/google/android/gms/internal/zzip;)V

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzip;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_16

    const-string v0, "Context.getCacheDir() returned null"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :cond_15
    :goto_15
    return-void

    :cond_16
    new-instance v1, Ljava/io/File;

    const-string v2, "admobVideoStreams"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_4e

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_4e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not create preload cache directory at "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    iput-object v5, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    goto :goto_15

    :cond_4e
    iget-object v0, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    invoke-virtual {v0, v4, v3}, Ljava/io/File;->setReadable(ZZ)Z

    move-result v0

    if-eqz v0, :cond_5e

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    invoke-virtual {v0, v4, v3}, Ljava/io/File;->setExecutable(ZZ)Z

    move-result v0

    if-nez v0, :cond_15

    :cond_5e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not set cache file permissions at "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    iput-object v5, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    goto :goto_15
.end method

.method private zza(Ljava/io/File;)Ljava/io/File;
    .registers 6

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".done"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static zzb(Ljava/io/File;)V
    .registers 3

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Ljava/io/File;->setLastModified(J)Z

    :goto_d
    return-void

    :cond_e
    :try_start_e
    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_11} :catch_12

    goto :goto_d

    :catch_12
    move-exception v0

    goto :goto_d
.end method


# virtual methods
.method public abort()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzdu;->zzxE:Z

    return-void
.end method

.method public zzZ(Ljava/lang/String;)Z
    .registers 26

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    if-nez v2, :cond_10

    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzdu;->zzf(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x0

    :goto_f
    return v2

    :cond_10
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/internal/zzdu;->zzdH()I

    move-result v3

    sget-object v2, Lcom/google/android/gms/internal/zzby;->zzuj:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v3, v2, :cond_37

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/internal/zzdu;->zzdI()Z

    move-result v2

    if-nez v2, :cond_10

    const-string v2, "Unable to expire stream cache"

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzdu;->zzf(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x0

    goto :goto_f

    :cond_37
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/gms/internal/zzdu;->zzaa(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v9, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    invoke-direct {v9, v3, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/google/android/gms/internal/zzdu;->zza(Ljava/io/File;)Ljava/io/File;

    move-result-object v10

    invoke-virtual {v9}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_80

    invoke-virtual {v10}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_80

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v2, v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Stream cache hit at "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v3, v2}, Lcom/google/android/gms/internal/zzdu;->zza(Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v2, 0x1

    goto :goto_f

    :cond_80
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    sget-object v3, Lcom/google/android/gms/internal/zzdu;->zzxB:Ljava/util/Set;

    monitor-enter v3

    :try_start_9e
    sget-object v2, Lcom/google/android/gms/internal/zzdu;->zzxB:Ljava/util/Set;

    invoke-interface {v2, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Stream cache already in progress at "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzdu;->zzf(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x0

    monitor-exit v3

    goto/16 :goto_f

    :catchall_cd
    move-exception v2

    monitor-exit v3
    :try_end_cf
    .catchall {:try_start_9e .. :try_end_cf} :catchall_cd

    throw v2

    :cond_d0
    :try_start_d0
    sget-object v2, Lcom/google/android/gms/internal/zzdu;->zzxB:Ljava/util/Set;

    invoke-interface {v2, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    monitor-exit v3
    :try_end_d6
    .catchall {:try_start_d0 .. :try_end_d6} :catchall_cd

    const/4 v4, 0x0

    :try_start_d7
    new-instance v2, Ljava/net/URL;

    move-object/from16 v0, p1

    invoke-direct {v2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    sget-object v2, Lcom/google/android/gms/internal/zzby;->zzuo:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v3, v2}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    invoke-virtual {v3, v2}, Ljava/net/URLConnection;->setReadTimeout(I)V

    instance-of v2, v3, Ljava/net/HttpURLConnection;

    if-eqz v2, :cond_18b

    move-object v0, v3

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v2, v0

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v5, 0x190

    if-lt v2, v5, :cond_18b

    new-instance v3, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "HTTP status code "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " at "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_129
    .catch Ljava/io/IOException; {:try_start_d7 .. :try_end_129} :catch_129

    :catch_129
    move-exception v2

    move-object v3, v4

    :goto_12b
    :try_start_12b
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_12e
    .catch Ljava/io/IOException; {:try_start_12b .. :try_end_12e} :catch_32d
    .catch Ljava/lang/NullPointerException; {:try_start_12b .. :try_end_12e} :catch_330

    :goto_12e
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/gms/internal/zzdu;->zzxE:Z

    if-eqz v3, :cond_30d

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Preload aborted for URL \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    :goto_152
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_178

    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_178

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not delete partial cache file at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :cond_178
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzdu;->zzf(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/google/android/gms/internal/zzdu;->zzxB:Ljava/util/Set;

    invoke-interface {v2, v11}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const/4 v2, 0x0

    goto/16 :goto_f

    :cond_18b
    :try_start_18b
    invoke-virtual {v3}, Ljava/net/URLConnection;->getContentLength()I

    move-result v6

    if-gez v6, :cond_1bc

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Stream cache aborted, missing content-length header at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzdu;->zzf(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/google/android/gms/internal/zzdu;->zzxB:Ljava/util/Set;

    invoke-interface {v2, v11}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const/4 v2, 0x0

    goto/16 :goto_f

    :cond_1bc
    sget-object v2, Lcom/google/android/gms/internal/zzdu;->zzxC:Ljava/text/DecimalFormat;

    int-to-long v12, v6

    invoke-virtual {v2, v12, v13}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    sget-object v2, Lcom/google/android/gms/internal/zzby;->zzuk:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v12

    if-le v6, v12, :cond_206

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Content length "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " exceeds limit at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzdu;->zzf(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/google/android/gms/internal/zzdu;->zzxB:Ljava/util/Set;

    invoke-interface {v2, v11}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const/4 v2, 0x0

    goto/16 :goto_f

    :cond_206
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Caching "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " bytes from "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/InputStream;)Ljava/nio/channels/ReadableByteChannel;

    move-result-object v13

    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_235
    .catch Ljava/io/IOException; {:try_start_18b .. :try_end_235} :catch_129

    :try_start_235
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v14

    const/high16 v2, 0x100000

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v15

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbB()Lcom/google/android/gms/internal/zzlm;

    move-result-object v16

    const/4 v5, 0x0

    invoke-interface/range {v16 .. v16}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v18

    sget-object v2, Lcom/google/android/gms/internal/zzby;->zzun:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    new-instance v17, Lcom/google/android/gms/internal/zzib;

    move-object/from16 v0, v17

    invoke-direct {v0, v2, v3}, Lcom/google/android/gms/internal/zzib;-><init>(J)V

    sget-object v2, Lcom/google/android/gms/internal/zzby;->zzum:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v20

    :cond_267
    :goto_267
    invoke-interface {v13, v15}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v2

    if-ltz v2, :cond_2bf

    add-int/2addr v5, v2

    if-le v5, v12, :cond_27c

    new-instance v2, Ljava/io/IOException;

    const-string v3, "stream cache file size limit exceeded"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    :catch_278
    move-exception v2

    move-object v3, v8

    goto/16 :goto_12b

    :cond_27c
    invoke-virtual {v15}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    :cond_27f
    invoke-virtual {v14, v15}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v2

    if-gtz v2, :cond_27f

    invoke-virtual {v15}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    invoke-interface/range {v16 .. v16}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v2

    sub-long v2, v2, v18

    const-wide/16 v22, 0x3e8

    mul-long v22, v22, v20

    cmp-long v2, v2, v22

    if-lez v2, :cond_29e

    new-instance v2, Ljava/io/IOException;

    const-string v3, "stream cache time limit exceeded"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_29e
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/gms/internal/zzdu;->zzxE:Z

    if-eqz v2, :cond_2ac

    new-instance v2, Ljava/io/IOException;

    const-string v3, "abort requested"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_2ac
    invoke-virtual/range {v17 .. v17}, Lcom/google/android/gms/internal/zzib;->tryAcquire()Z

    move-result v2

    if-eqz v2, :cond_267

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/google/android/gms/internal/zzdu;->zza(Ljava/lang/String;Ljava/lang/String;IIZ)V

    goto :goto_267

    :cond_2bf
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    const/4 v2, 0x3

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzM(I)Z

    move-result v2

    if-eqz v2, :cond_2f2

    sget-object v2, Lcom/google/android/gms/internal/zzdu;->zzxC:Ljava/text/DecimalFormat;

    int-to-long v6, v5

    invoke-virtual {v2, v6, v7}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Preloaded "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    :cond_2f2
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v9, v2, v3}, Ljava/io/File;->setReadable(ZZ)Z

    invoke-static {v10}, Lcom/google/android/gms/internal/zzdu;->zzb(Ljava/io/File;)V

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2, v5}, Lcom/google/android/gms/internal/zzdu;->zza(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v2, Lcom/google/android/gms/internal/zzdu;->zzxB:Ljava/util/Set;

    invoke-interface {v2, v11}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_30a
    .catch Ljava/io/IOException; {:try_start_235 .. :try_end_30a} :catch_278

    const/4 v2, 0x1

    goto/16 :goto_f

    :cond_30d
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Preload failed for URL \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_152

    :catch_32d
    move-exception v3

    goto/16 :goto_12e

    :catch_330
    move-exception v3

    goto/16 :goto_12e
.end method

.method public zzdH()I
    .registers 7

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    if-nez v1, :cond_6

    :cond_5
    return v0

    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    array-length v3, v2

    move v1, v0

    :goto_e
    if-ge v1, v3, :cond_5

    aget-object v4, v2, v1

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".done"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_20

    add-int/lit8 v0, v0, 0x1

    :cond_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_e
.end method

.method public zzdI()Z
    .registers 12

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    if-nez v0, :cond_6

    :goto_5
    return v6

    :cond_6
    const/4 v5, 0x0

    const-wide v2, 0x7fffffffffffffffL

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdu;->zzxD:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v8

    array-length v9, v8

    move v7, v6

    :goto_14
    if-ge v7, v9, :cond_33

    aget-object v4, v8, v7

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".done"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4c

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    cmp-long v10, v0, v2

    if-gez v10, :cond_4c

    move-object v2, v4

    :goto_2d
    add-int/lit8 v3, v7, 0x1

    move v7, v3

    move-object v5, v2

    move-wide v2, v0

    goto :goto_14

    :cond_33
    if-eqz v5, :cond_4a

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    move-result v0

    invoke-direct {p0, v5}, Lcom/google/android/gms/internal/zzdu;->zza(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_48

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v1

    and-int/2addr v0, v1

    :cond_48
    :goto_48
    move v6, v0

    goto :goto_5

    :cond_4a
    move v0, v6

    goto :goto_48

    :cond_4c
    move-wide v0, v2

    move-object v2, v5

    goto :goto_2d
.end method
