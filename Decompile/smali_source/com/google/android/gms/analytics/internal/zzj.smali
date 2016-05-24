.class Lcom/google/android/gms/analytics/internal/zzj;
.super Lcom/google/android/gms/analytics/internal/zzd;

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/analytics/internal/zzj$zza;
    }
.end annotation


# static fields
.field private static final zzMg:Ljava/lang/String;

.field private static final zzMh:Ljava/lang/String;


# instance fields
.field private final zzMi:Lcom/google/android/gms/analytics/internal/zzj$zza;

.field private final zzMj:Lcom/google/android/gms/analytics/internal/zzaj;

.field private final zzMk:Lcom/google/android/gms/analytics/internal/zzaj;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const-string v0, "CREATE TABLE IF NOT EXISTS %s ( \'%s\' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, \'%s\' INTEGER NOT NULL, \'%s\' TEXT NOT NULL, \'%s\' TEXT NOT NULL, \'%s\' INTEGER);"

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "hits2"

    aput-object v2, v1, v4

    const-string v2, "hit_id"

    aput-object v2, v1, v5

    const-string v2, "hit_time"

    aput-object v2, v1, v6

    const/4 v2, 0x3

    const-string v3, "hit_url"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "hit_string"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "hit_app_id"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/analytics/internal/zzj;->zzMg:Ljava/lang/String;

    const-string v0, "SELECT MAX(%s) FROM %s WHERE 1;"

    new-array v1, v6, [Ljava/lang/Object;

    const-string v2, "hit_time"

    aput-object v2, v1, v4

    const-string v2, "hits2"

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/analytics/internal/zzj;->zzMh:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 5

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzd;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzaj;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/analytics/internal/zzaj;-><init>(Lcom/google/android/gms/internal/zzlm;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzj;->zzMj:Lcom/google/android/gms/analytics/internal/zzaj;

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzaj;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/analytics/internal/zzaj;-><init>(Lcom/google/android/gms/internal/zzlm;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzj;->zzMk:Lcom/google/android/gms/analytics/internal/zzaj;

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zziJ()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/analytics/internal/zzj$zza;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzf;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2, v0}, Lcom/google/android/gms/analytics/internal/zzj$zza;-><init>(Lcom/google/android/gms/analytics/internal/zzj;Landroid/content/Context;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzj;->zzMi:Lcom/google/android/gms/analytics/internal/zzj$zza;

    return-void
.end method

.method private zza(Ljava/lang/String;[Ljava/lang/String;J)J
    .registers 8

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_5
    invoke-virtual {v0, p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_13
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_13} :catch_20
    .catchall {:try_start_5 .. :try_end_13} :catchall_27

    move-result-wide p3

    if-eqz v1, :cond_19

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_19
    :goto_19
    return-wide p3

    :cond_1a
    if-eqz v1, :cond_19

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_19

    :catch_20
    move-exception v0

    :try_start_21
    const-string v2, "Database error"

    invoke-virtual {p0, v2, p1, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    throw v0
    :try_end_27
    .catchall {:try_start_21 .. :try_end_27} :catchall_27

    :catchall_27
    move-exception v0

    if-eqz v1, :cond_2d

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_2d
    throw v0
.end method

.method static synthetic zza(Lcom/google/android/gms/analytics/internal/zzj;)Lcom/google/android/gms/analytics/internal/zzaj;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzj;->zzMk:Lcom/google/android/gms/analytics/internal/zzaj;

    return-object v0
.end method

.method private zzb(Ljava/lang/String;[Ljava/lang/String;)J
    .registers 7

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_5
    invoke-virtual {v0, p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_13
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_13} :catch_22
    .catchall {:try_start_5 .. :try_end_13} :catchall_29

    move-result-wide v2

    if-eqz v1, :cond_19

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_19
    return-wide v2

    :cond_1a
    :try_start_1a
    new-instance v0, Landroid/database/sqlite/SQLiteException;

    const-string v2, "Database returned empty set"

    invoke-direct {v0, v2}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_22
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1a .. :try_end_22} :catch_22
    .catchall {:try_start_1a .. :try_end_22} :catchall_29

    :catch_22
    move-exception v0

    :try_start_23
    const-string v2, "Database error"

    invoke-virtual {p0, v2, p1, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    throw v0
    :try_end_29
    .catchall {:try_start_23 .. :try_end_29} :catchall_29

    :catchall_29
    move-exception v0

    if-eqz v1, :cond_2f

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_2f
    throw v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/analytics/internal/zzj;)Ljava/lang/String;
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zziJ()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private zzd(Lcom/google/android/gms/analytics/internal/zzab;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzkm()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjy()Ljava/lang/String;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjz()Ljava/lang/String;

    move-result-object v0

    goto :goto_e
.end method

.method private static zze(Lcom/google/android/gms/analytics/internal/zzab;)Ljava/lang/String;
    .registers 6

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Landroid/net/Uri$Builder;

    invoke-direct {v2}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzab;->zzn()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_14
    :goto_14
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_48

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v4, "ht"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_14

    const-string v4, "qt"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_14

    const-string v4, "AppUID"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_14

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_14

    :cond_48
    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_54

    const-string v0, ""

    :cond_54
    return-object v0
.end method

.method private zziI()V
    .registers 7

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjI()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zziz()J

    move-result-wide v2

    add-int/lit8 v1, v0, -0x1

    int-to-long v4, v1

    cmp-long v1, v2, v4

    if-lez v1, :cond_2d

    int-to-long v0, v0

    sub-long v0, v2, v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/analytics/internal/zzj;->zzo(J)Ljava/util/List;

    move-result-object v0

    const-string v1, "Store full, deleting hits to make room, count"

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/google/android/gms/analytics/internal/zzj;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzd(Ljava/util/List;)V

    :cond_2d
    return-void
.end method

.method private zziJ()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-nez v0, :cond_13

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjK()Ljava/lang/String;

    move-result-object v0

    :goto_12
    return-object v0

    :cond_13
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjl()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjK()Ljava/lang/String;

    move-result-object v0

    goto :goto_12

    :cond_26
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjL()Ljava/lang/String;

    move-result-object v0

    goto :goto_12
.end method

.method static synthetic zziK()Ljava/lang/String;
    .registers 1

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzj;->zzMg:Ljava/lang/String;

    return-object v0
.end method

.method private static zzz(Ljava/util/Map;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Landroid/net/Uri$Builder;

    invoke-direct {v2}, Landroid/net/Uri$Builder;-><init>()V

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_10

    :cond_2c
    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_38

    const-string v0, ""

    :cond_38
    return-object v0
.end method


# virtual methods
.method public beginTransaction()V
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    return-void
.end method

.method public close()V
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzj;->zzMi:Lcom/google/android/gms/analytics/internal/zzj$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj$zza;->close()V
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_5} :catch_6
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_5} :catch_d

    :goto_5
    return-void

    :catch_6
    move-exception v0

    const-string v1, "Sql error closing database"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_5

    :catch_d
    move-exception v0

    const-string v1, "Error closing database"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_5
.end method

.method public endTransaction()V
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-void
.end method

.method getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzj;->zzMi:Lcom/google/android/gms/analytics/internal/zzj$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj$zza;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v0

    return-object v0

    :catch_7
    move-exception v0

    const-string v1, "Error opening database"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method isEmpty()Z
    .registers 5

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zziz()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public setTransactionSuccessful()V
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    return-void
.end method

.method public zza(JLjava/lang/String;Ljava/lang/String;)J
    .registers 10

    invoke-static {p3}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    invoke-static {p4}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzic()V

    const-string v0, "SELECT hits_count FROM properties WHERE app_uid=? AND cid=? AND tid=?"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p3, v1, v2

    const/4 v2, 0x2

    aput-object p4, v1, v2

    const-wide/16 v2, 0x0

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/google/android/gms/analytics/internal/zzj;->zza(Ljava/lang/String;[Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public zza(JLjava/lang/String;)V
    .registers 11

    invoke-static {p3}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "properties"

    const-string v2, "app_uid=? AND cid<>?"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p3, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_2d

    const-string v1, "Deleted property records"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2d
    return-void
.end method

.method public zzb(Lcom/google/android/gms/analytics/internal/zzh;)V
    .registers 8

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zzn()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzz(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v0, "app_uid"

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zziw()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "cid"

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->getClientId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "tid"

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zzix()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "adid"

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zziy()Z

    move-result v0

    if-eqz v0, :cond_6f

    const/4 v0, 0x1

    :goto_42
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "hits_count"

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zziz()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "params"

    invoke-virtual {v3, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_5b
    const-string v0, "properties"

    const/4 v2, 0x0

    const/4 v4, 0x5

    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_6e

    const-string v0, "Failed to insert/update a property (got -1)"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzbc(Ljava/lang/String;)V
    :try_end_6e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5b .. :try_end_6e} :catch_71

    :cond_6e
    :goto_6e
    return-void

    :cond_6f
    const/4 v0, 0x0

    goto :goto_42

    :catch_71
    move-exception v0

    const-string v1, "Error storing a property"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_6e
.end method

.method zzbd(Ljava/lang/String;)Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v4, 0x0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_d

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v4}, Ljava/util/HashMap;-><init>(I)V

    :goto_c
    return-object v0

    :cond_d
    :try_start_d
    const-string v0, "?"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_51

    :goto_15
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Lorg/apache/http/client/utils/URLEncodedUtils;->parse(Ljava/net/URI;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_65

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_44
    .catch Ljava/net/URISyntaxException; {:try_start_d .. :try_end_44} :catch_45

    goto :goto_2d

    :catch_45
    move-exception v0

    const-string v1, "Error parsing hit parameters"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v4}, Ljava/util/HashMap;-><init>(I)V

    goto :goto_c

    :cond_51
    :try_start_51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_63
    .catch Ljava/net/URISyntaxException; {:try_start_51 .. :try_end_63} :catch_45

    move-result-object p1

    goto :goto_15

    :cond_65
    move-object v0, v1

    goto :goto_c
.end method

.method zzbe(Ljava/lang/String;)Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v4, 0x0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_d

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v4}, Ljava/util/HashMap;-><init>(I)V

    :goto_c
    return-object v0

    :cond_d
    :try_start_d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    const-string v0, "UTF-8"

    invoke-static {v1, v0}, Lorg/apache/http/client/utils/URLEncodedUtils;->parse(Ljava/net/URI;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_38
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4f
    .catch Ljava/net/URISyntaxException; {:try_start_d .. :try_end_4f} :catch_50

    goto :goto_38

    :catch_50
    move-exception v0

    const-string v1, "Error parsing property parameters"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v4}, Ljava/util/HashMap;-><init>(I)V

    goto :goto_c

    :cond_5c
    move-object v0, v1

    goto :goto_c
.end method

.method public zzc(Lcom/google/android/gms/analytics/internal/zzab;)V
    .registers 8

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    invoke-static {p1}, Lcom/google/android/gms/analytics/internal/zzj;->zze(Lcom/google/android/gms/analytics/internal/zzab;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x2000

    if-le v1, v2, :cond_1f

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v1, "Hit length exceeds the maximum allowed size"

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(Lcom/google/android/gms/analytics/internal/zzab;Ljava/lang/String;)V

    :goto_1e
    return-void

    :cond_1f
    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zziI()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "hit_string"

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "hit_time"

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzkk()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "hit_app_id"

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzki()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "hit_url"

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzj;->zzd(Lcom/google/android/gms/analytics/internal/zzab;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_53
    const-string v0, "hits2"

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_6d

    const-string v0, "Failed to insert a hit (got -1)"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzbc(Ljava/lang/String;)V
    :try_end_65
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_53 .. :try_end_65} :catch_66

    goto :goto_1e

    :catch_66
    move-exception v0

    const-string v1, "Error storing a hit"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1e

    :cond_6d
    :try_start_6d
    const-string v2, "Hit saved to database. db-id, hit"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, v2, v0, p1}, Lcom/google/android/gms/analytics/internal/zzj;->zzb(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_76
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6d .. :try_end_76} :catch_66

    goto :goto_1e
.end method

.method public zzd(Ljava/util/List;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_f
    :goto_f
    return-void

    :cond_10
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v0, "hit_id"

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, " in ("

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    move v1, v0

    :goto_1e
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_4c

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-eqz v0, :cond_36

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-nez v3, :cond_3e

    :cond_36
    new-instance v0, Landroid/database/sqlite/SQLiteException;

    const-string v1, "Invalid hit id"

    invoke-direct {v0, v1}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3e
    if-lez v1, :cond_45

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_45
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1e

    :cond_4c
    const-string v0, ")"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :try_start_55
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "Deleting dispatched hits. count"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzj;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "hits2"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-eq v1, v2, :cond_f

    const-string v2, "Deleted fewer hits then expected"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v2, v3, v1, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzb(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_84
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_55 .. :try_end_84} :catch_85

    goto :goto_f

    :catch_85
    move-exception v0

    const-string v1, "Error deleting hits"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method protected zzhB()V
    .registers 1

    return-void
.end method

.method public zziG()I
    .registers 8

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzj;->zzMj:Lcom/google/android/gms/analytics/internal/zzaj;

    const-wide/32 v2, 0x5265c00

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/analytics/internal/zzaj;->zzv(J)Z

    move-result v1

    if-nez v1, :cond_13

    :goto_12
    return v0

    :cond_13
    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzj;->zzMj:Lcom/google/android/gms/analytics/internal/zzaj;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzaj;->start()V

    const-string v1, "Deleting stale hits (if any)"

    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/internal/zzj;->zzaY(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v2

    const-wide v4, 0x9a7ec800L

    sub-long/2addr v2, v4

    const-string v4, "hits2"

    const-string v5, "hit_time < ?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v6, v0

    invoke-virtual {v1, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    const-string v1, "Deleted stale hits, count"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/google/android/gms/analytics/internal/zzj;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_12
.end method

.method public zziH()J
    .registers 5

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzj;->zzMh:Ljava/lang/String;

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/google/android/gms/analytics/internal/zzj;->zza(Ljava/lang/String;[Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public zziz()J
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    const-string v0, "SELECT COUNT(*) FROM hits2"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/analytics/internal/zzj;->zzb(Ljava/lang/String;[Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public zzo(J)Ljava/util/List;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    const/4 v10, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_12

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_11
    return-object v0

    :cond_12
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    :try_start_1b
    const-string v1, "hits2"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "hit_id"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "%s ASC"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string v12, "hit_id"

    aput-object v12, v8, v11

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_3e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1b .. :try_end_3e} :catch_5e
    .catchall {:try_start_1b .. :try_end_3e} :catchall_6b

    move-result-object v1

    :try_start_3f
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_57

    :cond_45
    const/4 v0, 0x0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_54
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3f .. :try_end_54} :catch_75
    .catchall {:try_start_3f .. :try_end_54} :catchall_72

    move-result v0

    if-nez v0, :cond_45

    :cond_57
    if-eqz v1, :cond_5c

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_5c
    :goto_5c
    move-object v0, v9

    goto :goto_11

    :catch_5e
    move-exception v0

    move-object v1, v10

    :goto_60
    :try_start_60
    const-string v2, "Error selecting hit ids"

    invoke-virtual {p0, v2, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzd(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_65
    .catchall {:try_start_60 .. :try_end_65} :catchall_72

    if-eqz v1, :cond_5c

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_5c

    :catchall_6b
    move-exception v0

    :goto_6c
    if-eqz v10, :cond_71

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    :cond_71
    throw v0

    :catchall_72
    move-exception v0

    move-object v10, v1

    goto :goto_6c

    :catch_75
    move-exception v0

    goto :goto_60
.end method

.method public zzp(J)Ljava/util/List;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/analytics/internal/zzab;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v9, 0x0

    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-ltz v2, :cond_8f

    :goto_9
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzZ(Z)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    :try_start_16
    const-string v1, "hits2"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "hit_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "hit_time"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "hit_string"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "hit_url"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "hit_app_id"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "%s ASC"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string v11, "hit_id"

    aput-object v11, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_4d
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_16 .. :try_end_4d} :catch_92
    .catchall {:try_start_16 .. :try_end_4d} :catchall_a2

    move-result-object v9

    :try_start_4e
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_89

    :cond_59
    const/4 v0, 0x0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    const/4 v0, 0x1

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const/4 v0, 0x2

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzbd(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    invoke-static {v1}, Lcom/google/android/gms/analytics/internal/zzam;->zzbs(Ljava/lang/String;)Z

    move-result v5

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzab;

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/analytics/internal/zzab;-><init>(Lcom/google/android/gms/analytics/internal/zzc;Ljava/util/Map;JZJI)V

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_86
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4e .. :try_end_86} :catch_a4
    .catchall {:try_start_4e .. :try_end_86} :catchall_a2

    move-result v0

    if-nez v0, :cond_59

    :cond_89
    if-eqz v9, :cond_8e

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_8e
    return-object v10

    :cond_8f
    move v0, v1

    goto/16 :goto_9

    :catch_92
    move-exception v0

    move-object v1, v9

    :goto_94
    :try_start_94
    const-string v2, "Error loading hits from the database"

    invoke-virtual {p0, v2, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
    :try_end_9a
    .catchall {:try_start_94 .. :try_end_9a} :catchall_9a

    :catchall_9a
    move-exception v0

    move-object v9, v1

    :goto_9c
    if-eqz v9, :cond_a1

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_a1
    throw v0

    :catchall_a2
    move-exception v0

    goto :goto_9c

    :catch_a4
    move-exception v0

    move-object v1, v9

    goto :goto_94
.end method

.method public zzq(J)V
    .registers 6

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "Deleting hit, id"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/google/android/gms/analytics/internal/zzj;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzd(Ljava/util/List;)V

    return-void
.end method

.method public zzr(J)Ljava/util/List;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/analytics/internal/zzh;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v9, 0x0

    const/4 v1, 0x5

    :try_start_c
    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v3, "cid"

    aput-object v3, v2, v1

    const/4 v1, 0x1

    const-string v3, "tid"

    aput-object v3, v2, v1

    const/4 v1, 0x2

    const-string v3, "adid"

    aput-object v3, v2, v1

    const/4 v1, 0x3

    const-string v3, "hits_count"

    aput-object v3, v2, v1

    const/4 v1, 0x4

    const-string v3, "params"

    aput-object v3, v2, v1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzj;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzjJ()I

    move-result v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    const-string v3, "app_uid=?"

    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    const-string v1, "properties"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_47
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_c .. :try_end_47} :catch_ba
    .catchall {:try_start_c .. :try_end_47} :catchall_b8

    move-result-object v9

    :try_start_48
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_8b

    :cond_53
    const/4 v0, 0x0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x1

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v0, 0x2

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-eqz v0, :cond_9c

    const/4 v5, 0x1

    :goto_65
    const/4 v0, 0x3

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    int-to-long v6, v0

    const/4 v0, 0x4

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzbe(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v8

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_80

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_9e

    :cond_80
    const-string v0, "Read property with empty client id or tracker id"

    invoke-virtual {p0, v0, v3, v4}, Lcom/google/android/gms/analytics/internal/zzj;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_85
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_53

    :cond_8b
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v0

    if-lt v0, v10, :cond_96

    const-string v0, "Sending hits to too many properties. Campaign report might be incorrect"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zzbb(Ljava/lang/String;)V
    :try_end_96
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_48 .. :try_end_96} :catch_a8
    .catchall {:try_start_48 .. :try_end_96} :catchall_b8

    :cond_96
    if-eqz v9, :cond_9b

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_9b
    return-object v11

    :cond_9c
    const/4 v5, 0x0

    goto :goto_65

    :cond_9e
    :try_start_9e
    new-instance v0, Lcom/google/android/gms/analytics/internal/zzh;

    move-wide v1, p1

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/analytics/internal/zzh;-><init>(JLjava/lang/String;Ljava/lang/String;ZJLjava/util/Map;)V

    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_a7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_9e .. :try_end_a7} :catch_a8
    .catchall {:try_start_9e .. :try_end_a7} :catchall_b8

    goto :goto_85

    :catch_a8
    move-exception v0

    move-object v1, v9

    :goto_aa
    :try_start_aa
    const-string v2, "Error loading hits from the database"

    invoke-virtual {p0, v2, v0}, Lcom/google/android/gms/analytics/internal/zzj;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
    :try_end_b0
    .catchall {:try_start_aa .. :try_end_b0} :catchall_b0

    :catchall_b0
    move-exception v0

    move-object v9, v1

    :goto_b2
    if-eqz v9, :cond_b7

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_b7
    throw v0

    :catchall_b8
    move-exception v0

    goto :goto_b2

    :catch_ba
    move-exception v0

    move-object v1, v9

    goto :goto_aa
.end method
