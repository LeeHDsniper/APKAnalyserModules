.class public Lcom/google/android/gms/internal/zzqr;
.super Ljava/lang/Object;


# static fields
.field public static final zzaUg:Ljava/lang/Integer;

.field public static final zzaUh:Ljava/lang/Integer;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzaRv:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzqr;->zzaUg:Ljava/lang/Integer;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzqr;->zzaUh:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzqr;-><init>(Landroid/content/Context;Ljava/util/concurrent/ExecutorService;)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/util/concurrent/ExecutorService;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqr;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzqr;->zzaRv:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private zzfr(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "resource_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private zzm(Ljava/io/InputStream;)[B
    .registers 5

    const/4 v0, 0x0

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_6
    invoke-static {p1, v1}, Lcom/google/android/gms/internal/zzlr;->zza(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_9} :catch_18
    .catchall {:try_start_6 .. :try_end_9} :catchall_29

    :try_start_9
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_c} :catch_11

    :goto_c
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    :goto_10
    return-object v0

    :catch_11
    move-exception v1

    const-string v1, "Error closing stream for reading resource from disk"

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_10

    :catch_18
    move-exception v2

    :try_start_19
    const-string v2, "Failed to read the resource from disk"

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V
    :try_end_1e
    .catchall {:try_start_19 .. :try_end_1e} :catchall_29

    :try_start_1e
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_21} :catch_22

    goto :goto_c

    :catch_22
    move-exception v1

    const-string v1, "Error closing stream for reading resource from disk"

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_10

    :catchall_29
    move-exception v1

    :try_start_2a
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_2d} :catch_2e

    throw v1

    :catch_2e
    move-exception v1

    const-string v1, "Error closing stream for reading resource from disk"

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_10
.end method


# virtual methods
.method public zza(Ljava/lang/String;Ljava/lang/Integer;Lcom/google/android/gms/internal/zzql;Lcom/google/android/gms/internal/zzqq;)V
    .registers 12

    iget-object v6, p0, Lcom/google/android/gms/internal/zzqr;->zzaRv:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/google/android/gms/internal/zzqr$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzqr$1;-><init>(Lcom/google/android/gms/internal/zzqr;Ljava/lang/String;Ljava/lang/Integer;Lcom/google/android/gms/internal/zzql;Lcom/google/android/gms/internal/zzqq;)V

    invoke-interface {v6, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method zzb(Ljava/lang/String;Ljava/lang/Integer;Lcom/google/android/gms/internal/zzql;Lcom/google/android/gms/internal/zzqq;)V
    .registers 15

    const-wide/16 v8, 0x0

    const/4 v6, 0x0

    const-string v0, "DiskLoader: Starting to load resource from Disk."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    :try_start_8
    new-instance v0, Ljava/io/FileInputStream;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzqr;->zzfq(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzqr;->zzm(Ljava/io/InputStream;)[B

    move-result-object v0

    invoke-interface {p3, v0}, Lcom/google/android/gms/internal/zzql;->zzt([B)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_5d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Saved resource loaded: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzqr;->zzfr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    sget-object v1, Lcom/google/android/gms/common/api/Status;->zzaaD:Lcom/google/android/gms/common/api/Status;

    sget-object v3, Lcom/google/android/gms/internal/zzqr;->zzaUh:Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzqr;->zzfp(Ljava/lang/String;)J

    move-result-wide v4

    move-object v0, p4

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzqq;->zza(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Ljava/lang/Integer;J)V
    :try_end_41
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_41} :catch_42
    .catch Lcom/google/android/gms/internal/zzqp$zzg; {:try_start_8 .. :try_end_41} :catch_69

    :goto_41
    return-void

    :catch_42
    move-exception v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Saved resource not found: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzqr;->zzfr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    :cond_5d
    :goto_5d
    if-nez p2, :cond_85

    sget-object v1, Lcom/google/android/gms/common/api/Status;->zzaaF:Lcom/google/android/gms/common/api/Status;

    move-object v0, p4

    move-object v2, v6

    move-object v3, v6

    move-wide v4, v8

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzqq;->zza(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Ljava/lang/Integer;J)V

    goto :goto_41

    :catch_69
    move-exception v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Saved resource is corrupted: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzqr;->zzfr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    goto :goto_5d

    :cond_85
    :try_start_85
    iget-object v0, p0, Lcom/google/android/gms/internal/zzqr;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_e6

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzqr;->zzm(Ljava/io/InputStream;)[B

    move-result-object v0

    invoke-interface {p3, v0}, Lcom/google/android/gms/internal/zzql;->zzt([B)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_e6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Default resource loaded: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqr;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    sget-object v1, Lcom/google/android/gms/common/api/Status;->zzaaD:Lcom/google/android/gms/common/api/Status;

    sget-object v3, Lcom/google/android/gms/internal/zzqr;->zzaUg:Ljava/lang/Integer;

    const-wide/16 v4, 0x0

    move-object v0, p4

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzqq;->zza(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Ljava/lang/Integer;J)V
    :try_end_cd
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_85 .. :try_end_cd} :catch_cf
    .catch Lcom/google/android/gms/internal/zzqp$zzg; {:try_start_85 .. :try_end_cd} :catch_f1

    goto/16 :goto_41

    :catch_cf
    move-exception v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Default resource not found. ID: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    :cond_e6
    :goto_e6
    sget-object v1, Lcom/google/android/gms/common/api/Status;->zzaaF:Lcom/google/android/gms/common/api/Status;

    move-object v0, p4

    move-object v2, v6

    move-object v3, v6

    move-wide v4, v8

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzqq;->zza(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Ljava/lang/Integer;J)V

    goto/16 :goto_41

    :catch_f1
    move-exception v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Default resource resource is corrupted: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    goto :goto_e6
.end method

.method public zze(Ljava/lang/String;[B)V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqr;->zzaRv:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/android/gms/internal/zzqr$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/gms/internal/zzqr$2;-><init>(Lcom/google/android/gms/internal/zzqr;Ljava/lang/String;[B)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method zzf(Ljava/lang/String;[B)V
    .registers 6

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzqr;->zzfq(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    :try_start_4
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_9
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_9} :catch_2c

    :try_start_9
    invoke-virtual {v1, p2}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_c} :catch_3a
    .catchall {:try_start_9 .. :try_end_c} :catchall_6a

    :try_start_c
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Resource "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " saved on Disk."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_2b} :catch_33

    :goto_2b
    return-void

    :catch_2c
    move-exception v0

    const-string v0, "Error opening resource file for writing"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    goto :goto_2b

    :catch_33
    move-exception v0

    const-string v0, "Error closing stream for writing resource to disk"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    goto :goto_2b

    :catch_3a
    move-exception v2

    :try_start_3b
    const-string v2, "Error writing resource to disk. Removing resource from disk"

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_43
    .catchall {:try_start_3b .. :try_end_43} :catchall_6a

    :try_start_43
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Resource "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " saved on Disk."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V
    :try_end_62
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_62} :catch_63

    goto :goto_2b

    :catch_63
    move-exception v0

    const-string v0, "Error closing stream for writing resource to disk"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    goto :goto_2b

    :catchall_6a
    move-exception v0

    :try_start_6b
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Resource "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " saved on Disk."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V
    :try_end_8a
    .catch Ljava/io/IOException; {:try_start_6b .. :try_end_8a} :catch_8b

    :goto_8a
    throw v0

    :catch_8b
    move-exception v1

    const-string v1, "Error closing stream for writing resource to disk"

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    goto :goto_8a
.end method

.method public zzfp(Ljava/lang/String;)J
    .registers 4

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzqr;->zzfq(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    :goto_e
    return-wide v0

    :cond_f
    const-wide/16 v0, 0x0

    goto :goto_e
.end method

.method zzfq(Ljava/lang/String;)Ljava/io/File;
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqr;->mContext:Landroid/content/Context;

    const-string v1, "google_tagmanager"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzqr;->zzfr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method
