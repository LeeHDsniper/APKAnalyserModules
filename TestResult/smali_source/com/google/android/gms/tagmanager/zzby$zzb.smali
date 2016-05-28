.class Lcom/google/android/gms/tagmanager/zzby$zzb;
.super Landroid/database/sqlite/SQLiteOpenHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/tagmanager/zzby;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "zzb"
.end annotation


# instance fields
.field final synthetic zzaQS:Lcom/google/android/gms/tagmanager/zzby;

.field private zzaQT:Z

.field private zzaQU:J


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/zzby;Landroid/content/Context;Ljava/lang/String;)V
    .registers 6

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzby$zzb;->zzaQS:Lcom/google/android/gms/tagmanager/zzby;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p2, p3, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/tagmanager/zzby$zzb;->zzaQU:J

    return-void
.end method

.method private zza(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)Z
    .registers 13

    const/4 v8, 0x0

    const/4 v9, 0x0

    :try_start_2
    const-string v1, "SQLITE_MASTER"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "name"

    aput-object v3, v2, v0

    const-string v3, "name=?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v4, v0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_1b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_1b} :catch_26
    .catchall {:try_start_2 .. :try_end_1b} :catchall_45

    move-result-object v1

    :try_start_1c
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_1f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1c .. :try_end_1f} :catch_53
    .catchall {:try_start_1c .. :try_end_1f} :catchall_4c

    move-result v0

    if-eqz v1, :cond_25

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_25
    :goto_25
    return v0

    :catch_26
    move-exception v0

    move-object v0, v9

    :goto_28
    :try_start_28
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error querying for table "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V
    :try_end_3e
    .catchall {:try_start_28 .. :try_end_3e} :catchall_4f

    if-eqz v0, :cond_43

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_43
    move v0, v8

    goto :goto_25

    :catchall_45
    move-exception v0

    :goto_46
    if-eqz v9, :cond_4b

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_4b
    throw v0

    :catchall_4c
    move-exception v0

    move-object v9, v1

    goto :goto_46

    :catchall_4f
    move-exception v1

    move-object v9, v0

    move-object v0, v1

    goto :goto_46

    :catch_53
    move-exception v0

    move-object v0, v1

    goto :goto_28
.end method

.method private zzc(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 7

    const-string v0, "SELECT * FROM gtm_hits WHERE 0"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    :try_start_c
    invoke-interface {v1}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x0

    :goto_11
    array-length v4, v3

    if-ge v0, v4, :cond_1c

    aget-object v4, v3, v0

    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_19
    .catchall {:try_start_c .. :try_end_19} :catchall_47

    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    :cond_1c
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    const-string v0, "hit_id"

    invoke-interface {v2, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    const-string v0, "hit_url"

    invoke-interface {v2, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    const-string v0, "hit_time"

    invoke-interface {v2, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    const-string v0, "hit_first_send_time"

    invoke-interface {v2, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4c

    :cond_3f
    new-instance v0, Landroid/database/sqlite/SQLiteException;

    const-string v1, "Database column missing"

    invoke-direct {v0, v1}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_47
    move-exception v0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw v0

    :cond_4c
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5a

    new-instance v0, Landroid/database/sqlite/SQLiteException;

    const-string v1, "Database has extra columns"

    invoke-direct {v0, v1}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5a
    return-void
.end method


# virtual methods
.method public getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .registers 5

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzby$zzb;->zzaQT:Z

    if-eqz v0, :cond_20

    iget-wide v0, p0, Lcom/google/android/gms/tagmanager/zzby$zzb;->zzaQU:J

    const-wide/32 v2, 0x36ee80

    add-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzby$zzb;->zzaQS:Lcom/google/android/gms/tagmanager/zzby;

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzby;->zza(Lcom/google/android/gms/tagmanager/zzby;)Lcom/google/android/gms/internal/zzlm;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_20

    new-instance v0, Landroid/database/sqlite/SQLiteException;

    const-string v1, "Database creation failed"

    invoke-direct {v0, v1}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_20
    const/4 v0, 0x0

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/gms/tagmanager/zzby$zzb;->zzaQT:Z

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzby$zzb;->zzaQS:Lcom/google/android/gms/tagmanager/zzby;

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzby;->zza(Lcom/google/android/gms/tagmanager/zzby;)Lcom/google/android/gms/internal/zzlm;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/tagmanager/zzby$zzb;->zzaQU:J

    :try_start_30
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_33
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_30 .. :try_end_33} :catch_3e

    move-result-object v0

    :goto_34
    if-nez v0, :cond_3a

    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    :cond_3a
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/gms/tagmanager/zzby$zzb;->zzaQT:Z

    return-object v0

    :catch_3e
    move-exception v1

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzby$zzb;->zzaQS:Lcom/google/android/gms/tagmanager/zzby;

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzby;->zzc(Lcom/google/android/gms/tagmanager/zzby;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzby$zzb;->zzaQS:Lcom/google/android/gms/tagmanager/zzby;

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzby;->zzb(Lcom/google/android/gms/tagmanager/zzby;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_34
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzal;->zzbj(Ljava/lang/String;)Z

    return-void
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 4
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xf

    if-ge v0, v1, :cond_13

    const-string v0, "PRAGMA journal_mode=memory"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    :try_start_d
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_10
    .catchall {:try_start_d .. :try_end_10} :catchall_23

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_13
    const-string v0, "gtm_hits"

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/tagmanager/zzby$zzb;->zza(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)Z

    move-result v0

    if-nez v0, :cond_28

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzby;->zzAu()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :goto_22
    return-void

    :catchall_23
    move-exception v1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v1

    :cond_28
    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/zzby$zzb;->zzc(Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_22
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 4
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    return-void
.end method
