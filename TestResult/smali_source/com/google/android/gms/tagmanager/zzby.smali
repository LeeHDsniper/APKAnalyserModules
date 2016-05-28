.class Lcom/google/android/gms/tagmanager/zzby;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzau;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/zzby$zzb;,
        Lcom/google/android/gms/tagmanager/zzby$zza;
    }
.end annotation


# static fields
.field private static final zzMg:Ljava/lang/String;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzaQM:Lcom/google/android/gms/tagmanager/zzby$zzb;

.field private volatile zzaQN:Lcom/google/android/gms/tagmanager/zzac;

.field private final zzaQO:Lcom/google/android/gms/tagmanager/zzav;

.field private final zzaQP:Ljava/lang/String;

.field private zzaQQ:J

.field private final zzaQR:I

.field private zzpO:Lcom/google/android/gms/internal/zzlm;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const-string v0, "CREATE TABLE IF NOT EXISTS %s ( \'%s\' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, \'%s\' INTEGER NOT NULL, \'%s\' TEXT NOT NULL,\'%s\' INTEGER NOT NULL);"

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "gtm_hits"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "hit_id"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "hit_time"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "hit_url"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "hit_first_send_time"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzby;->zzMg:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/tagmanager/zzav;Landroid/content/Context;)V
    .registers 5

    const-string v0, "gtm_urls.db"

    const/16 v1, 0x7d0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/google/android/gms/tagmanager/zzby;-><init>(Lcom/google/android/gms/tagmanager/zzav;Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/tagmanager/zzav;Landroid/content/Context;Ljava/lang/String;I)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzby;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQP:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQO:Lcom/google/android/gms/tagmanager/zzav;

    invoke-static {}, Lcom/google/android/gms/internal/zzlo;->zzpN()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzby;->zzpO:Lcom/google/android/gms/internal/zzlm;

    new-instance v0, Lcom/google/android/gms/tagmanager/zzby$zzb;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzby;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQP:Ljava/lang/String;

    invoke-direct {v0, p0, v1, v2}, Lcom/google/android/gms/tagmanager/zzby$zzb;-><init>(Lcom/google/android/gms/tagmanager/zzby;Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQM:Lcom/google/android/gms/tagmanager/zzby$zzb;

    new-instance v0, Lcom/google/android/gms/tagmanager/zzcx;

    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzby;->mContext:Landroid/content/Context;

    new-instance v3, Lcom/google/android/gms/tagmanager/zzby$zza;

    invoke-direct {v3, p0}, Lcom/google/android/gms/tagmanager/zzby$zza;-><init>(Lcom/google/android/gms/tagmanager/zzby;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/tagmanager/zzcx;-><init>(Lorg/apache/http/client/HttpClient;Landroid/content/Context;Lcom/google/android/gms/tagmanager/zzcx$zza;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQN:Lcom/google/android/gms/tagmanager/zzac;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQQ:J

    iput p4, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQR:I

    return-void
.end method

.method private zzAr()V
    .registers 4

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzby;->zzAs()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQR:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    if-lez v0, :cond_3b

    invoke-virtual {p0, v0}, Lcom/google/android/gms/tagmanager/zzby;->zzjj(I)Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store full, deleting "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " hits to make room."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/tagmanager/zzby;->zzf([Ljava/lang/String;)V

    :cond_3b
    return-void
.end method

.method static synthetic zzAu()Ljava/lang/String;
    .registers 1

    sget-object v0, Lcom/google/android/gms/tagmanager/zzby;->zzMg:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/tagmanager/zzby;)Lcom/google/android/gms/internal/zzlm;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzby;->zzpO:Lcom/google/android/gms/internal/zzlm;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/tagmanager/zzby;J)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/tagmanager/zzby;->zzq(J)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/tagmanager/zzby;JJ)V
    .registers 6

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/tagmanager/zzby;->zzc(JJ)V

    return-void
.end method

.method static synthetic zzb(Lcom/google/android/gms/tagmanager/zzby;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQP:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/tagmanager/zzby;)Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzby;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private zzc(JJ)V
    .registers 12

    const-string v0, "Error opening database for getNumStoredHits."

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzby;->zzeG(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-nez v0, :cond_9

    :goto_8
    return-void

    :cond_9
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "hit_first_send_time"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :try_start_17
    const-string v2, "gtm_hits"

    const-string v3, "hit_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_28
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_17 .. :try_end_28} :catch_29

    goto :goto_8

    :catch_29
    move-exception v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error setting HIT_FIRST_DISPATCH_TIME for hitId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/tagmanager/zzby;->zzq(J)V

    goto :goto_8
.end method

.method private zzeG(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQM:Lcom/google/android/gms/tagmanager/zzby$zzb;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzby$zzb;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v0

    :goto_6
    return-object v0

    :catch_7
    move-exception v0

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_6
.end method

.method private zzh(JLjava/lang/String;)V
    .registers 9

    const/4 v4, 0x0

    const-string v0, "Error opening database for putHit"

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzby;->zzeG(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-nez v0, :cond_a

    :goto_9
    return-void

    :cond_a
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "hit_time"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v2, "hit_url"

    invoke-virtual {v1, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "hit_first_send_time"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :try_start_26
    const-string v2, "gtm_hits"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQO:Lcom/google/android/gms/tagmanager/zzav;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/google/android/gms/tagmanager/zzav;->zzas(Z)V
    :try_end_32
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_26 .. :try_end_32} :catch_33

    goto :goto_9

    :catch_33
    move-exception v0

    const-string v0, "Error storing hit"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_9
.end method

.method private zzq(J)V
    .registers 6

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/tagmanager/zzby;->zzf([Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public dispatch()V
    .registers 3

    const-string v0, "GTM Dispatch running..."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQN:Lcom/google/android/gms/tagmanager/zzac;

    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/zzac;->zzzX()Z

    move-result v0

    if-nez v0, :cond_e

    :cond_d
    :goto_d
    return-void

    :cond_e
    const/16 v0, 0x28

    invoke-virtual {p0, v0}, Lcom/google/android/gms/tagmanager/zzby;->zzjk(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_26

    const-string v0, "...nothing to dispatch"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQO:Lcom/google/android/gms/tagmanager/zzav;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/google/android/gms/tagmanager/zzav;->zzas(Z)V

    goto :goto_d

    :cond_26
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQN:Lcom/google/android/gms/tagmanager/zzac;

    invoke-interface {v1, v0}, Lcom/google/android/gms/tagmanager/zzac;->zzr(Ljava/util/List;)V

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzby;->zzAt()I

    move-result v0

    if-lez v0, :cond_d

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzcu;->zzAP()Lcom/google/android/gms/tagmanager/zzcu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzcu;->dispatch()V

    goto :goto_d
.end method

.method zzAs()I
    .registers 6

    const/4 v1, 0x0

    const/4 v0, 0x0

    const-string v2, "Error opening database for getNumStoredHits."

    invoke-direct {p0, v2}, Lcom/google/android/gms/tagmanager/zzby;->zzeG(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    if-nez v2, :cond_b

    :cond_a
    :goto_a
    return v0

    :cond_b
    :try_start_b
    const-string v3, "SELECT COUNT(*) from gtm_hits"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1e

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getLong(I)J
    :try_end_1c
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_b .. :try_end_1c} :catch_24
    .catchall {:try_start_b .. :try_end_1c} :catchall_30

    move-result-wide v2

    long-to-int v0, v2

    :cond_1e
    if-eqz v1, :cond_a

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_a

    :catch_24
    move-exception v2

    :try_start_25
    const-string v2, "Error getting numStoredHits"

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V
    :try_end_2a
    .catchall {:try_start_25 .. :try_end_2a} :catchall_30

    if-eqz v1, :cond_a

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_a

    :catchall_30
    move-exception v0

    if-eqz v1, :cond_36

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_36
    throw v0
.end method

.method zzAt()I
    .registers 11

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v0, "Error opening database for getNumStoredHits."

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzby;->zzeG(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-nez v0, :cond_b

    :goto_a
    return v8

    :cond_b
    :try_start_b
    const-string v1, "gtm_hits"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "hit_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "hit_first_send_time"

    aput-object v4, v2, v3

    const-string v3, "hit_first_send_time=0"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_23
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_b .. :try_end_23} :catch_2f
    .catchall {:try_start_b .. :try_end_23} :catchall_3d

    move-result-object v1

    :try_start_24
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I
    :try_end_27
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_24 .. :try_end_27} :catch_4b
    .catchall {:try_start_24 .. :try_end_27} :catchall_44

    move-result v0

    if-eqz v1, :cond_2d

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_2d
    :goto_2d
    move v8, v0

    goto :goto_a

    :catch_2f
    move-exception v0

    move-object v0, v9

    :goto_31
    :try_start_31
    const-string v1, "Error getting num untried hits"

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V
    :try_end_36
    .catchall {:try_start_31 .. :try_end_36} :catchall_47

    if-eqz v0, :cond_4e

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    move v0, v8

    goto :goto_2d

    :catchall_3d
    move-exception v0

    :goto_3e
    if-eqz v9, :cond_43

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_43
    throw v0

    :catchall_44
    move-exception v0

    move-object v9, v1

    goto :goto_3e

    :catchall_47
    move-exception v1

    move-object v9, v0

    move-object v0, v1

    goto :goto_3e

    :catch_4b
    move-exception v0

    move-object v0, v1

    goto :goto_31

    :cond_4e
    move v0, v8

    goto :goto_2d
.end method

.method zzf([Ljava/lang/String;)V
    .registers 10

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_7

    array-length v2, p1

    if-nez v2, :cond_8

    :cond_7
    :goto_7
    return-void

    :cond_8
    const-string v2, "Error opening database for deleteHits."

    invoke-direct {p0, v2}, Lcom/google/android/gms/tagmanager/zzby;->zzeG(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    if-eqz v2, :cond_7

    const-string v3, "HIT_ID in (%s)"

    new-array v4, v0, [Ljava/lang/Object;

    const-string v5, ","

    array-length v6, p1

    const-string v7, "?"

    invoke-static {v6, v7}, Ljava/util/Collections;->nCopies(ILjava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    :try_start_27
    const-string v4, "gtm_hits"

    invoke-virtual {v2, v4, v3, p1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQO:Lcom/google/android/gms/tagmanager/zzav;

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzby;->zzAs()I

    move-result v3

    if-nez v3, :cond_3f

    :goto_34
    invoke-interface {v2, v0}, Lcom/google/android/gms/tagmanager/zzav;->zzas(Z)V
    :try_end_37
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_27 .. :try_end_37} :catch_38

    goto :goto_7

    :catch_38
    move-exception v0

    const-string v0, "Error deleting hits"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_7

    :cond_3f
    move v0, v1

    goto :goto_34
.end method

.method public zzg(JLjava/lang/String;)V
    .registers 5

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzby;->zziG()I

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzby;->zzAr()V

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/tagmanager/zzby;->zzh(JLjava/lang/String;)V

    return-void
.end method

.method zziG()I
    .registers 9

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzby;->zzpO:Lcom/google/android/gms/internal/zzlm;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQQ:J

    const-wide/32 v6, 0x5265c00

    add-long/2addr v4, v6

    cmp-long v4, v2, v4

    if-gtz v4, :cond_13

    :cond_12
    :goto_12
    return v1

    :cond_13
    iput-wide v2, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQQ:J

    const-string v2, "Error opening database for deleteStaleHits."

    invoke-direct {p0, v2}, Lcom/google/android/gms/tagmanager/zzby;->zzeG(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    if-eqz v2, :cond_12

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/zzby;->zzpO:Lcom/google/android/gms/internal/zzlm;

    invoke-interface {v3}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v4

    const-wide v6, 0x9a7ec800L

    sub-long/2addr v4, v6

    const-string v3, "gtm_hits"

    const-string v6, "HIT_TIME < ?"

    new-array v7, v0, [Ljava/lang/String;

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v7, v1

    invoke-virtual {v2, v3, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/zzby;->zzaQO:Lcom/google/android/gms/tagmanager/zzav;

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzby;->zzAs()I

    move-result v4

    if-nez v4, :cond_46

    :goto_41
    invoke-interface {v3, v0}, Lcom/google/android/gms/tagmanager/zzav;->zzas(Z)V

    move v1, v2

    goto :goto_12

    :cond_46
    move v0, v1

    goto :goto_41
.end method

.method zzjj(I)Ljava/util/List;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v10, 0x0

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    if-gtz p1, :cond_f

    const-string v0, "Invalid maxHits specified. Skipping"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    move-object v0, v9

    :goto_e
    return-object v0

    :cond_f
    const-string v0, "Error opening database for peekHitIds."

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzby;->zzeG(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-nez v0, :cond_19

    move-object v0, v9

    goto :goto_e

    :cond_19
    :try_start_19
    const-string v1, "gtm_hits"

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

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_3c
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_19 .. :try_end_3c} :catch_5c
    .catchall {:try_start_19 .. :try_end_3c} :catchall_7e

    move-result-object v1

    :try_start_3d
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_55

    :cond_43
    const/4 v0, 0x0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_52
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3d .. :try_end_52} :catch_88
    .catchall {:try_start_3d .. :try_end_52} :catchall_86

    move-result v0

    if-nez v0, :cond_43

    :cond_55
    if-eqz v1, :cond_5a

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_5a
    :goto_5a
    move-object v0, v9

    goto :goto_e

    :catch_5c
    move-exception v0

    move-object v1, v10

    :goto_5e
    :try_start_5e
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error in peekHits fetching hitIds: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V
    :try_end_78
    .catchall {:try_start_5e .. :try_end_78} :catchall_86

    if-eqz v1, :cond_5a

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_5a

    :catchall_7e
    move-exception v0

    move-object v1, v10

    :goto_80
    if-eqz v1, :cond_85

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_85
    throw v0

    :catchall_86
    move-exception v0

    goto :goto_80

    :catch_88
    move-exception v0

    goto :goto_5e
.end method

.method public zzjk(I)Ljava/util/List;
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/tagmanager/zzaq;",
            ">;"
        }
    .end annotation

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    const-string v2, "Error opening database for peekHits"

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/google/android/gms/tagmanager/zzby;->zzeG(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    if-nez v2, :cond_11

    move-object v2, v11

    :cond_10
    :goto_10
    return-object v2

    :cond_11
    const/4 v12, 0x0

    :try_start_12
    const-string v3, "gtm_hits"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "hit_id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "hit_time"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "hit_first_send_time"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "%s ASC"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "hit_id"

    aput-object v14, v10, v13

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {v2 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_3f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_12 .. :try_end_3f} :catch_ca
    .catchall {:try_start_12 .. :try_end_3f} :catchall_ef

    move-result-object v13

    :try_start_40
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V
    :try_end_45
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_40 .. :try_end_45} :catch_171
    .catchall {:try_start_40 .. :try_end_45} :catchall_16b

    :try_start_45
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_68

    :cond_4b
    new-instance v3, Lcom/google/android/gms/tagmanager/zzaq;

    const/4 v4, 0x0

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    const/4 v6, 0x1

    invoke-interface {v13, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    const/4 v8, 0x2

    invoke-interface {v13, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    invoke-direct/range {v3 .. v9}, Lcom/google/android/gms/tagmanager/zzaq;-><init>(JJJ)V

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_65
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_45 .. :try_end_65} :catch_177
    .catchall {:try_start_45 .. :try_end_65} :catchall_16b

    move-result v3

    if-nez v3, :cond_4b

    :cond_68
    if-eqz v13, :cond_6d

    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    :cond_6d
    const/4 v11, 0x0

    :try_start_6e
    const-string v3, "gtm_hits"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "hit_id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "hit_url"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "%s ASC"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string v15, "hit_id"

    aput-object v15, v10, v14

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {v2 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_96
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6e .. :try_end_96} :catch_169
    .catchall {:try_start_6e .. :try_end_96} :catchall_15f

    move-result-object v3

    :try_start_97
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_c2

    move v4, v11

    :goto_9e
    move-object v0, v3

    check-cast v0, Landroid/database/sqlite/SQLiteCursor;

    move-object v2, v0

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteCursor;->getWindow()Landroid/database/CursorWindow;

    move-result-object v2

    invoke-virtual {v2}, Landroid/database/CursorWindow;->getNumRows()I

    move-result v2

    if-lez v2, :cond_f6

    invoke-interface {v12, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/tagmanager/zzaq;

    const/4 v5, 0x1

    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/google/android/gms/tagmanager/zzaq;->zzeK(Ljava/lang/String;)V

    :goto_ba
    add-int/lit8 v2, v4, 0x1

    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_bf
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_97 .. :try_end_bf} :catch_114
    .catchall {:try_start_97 .. :try_end_bf} :catchall_166

    move-result v4

    if-nez v4, :cond_17d

    :cond_c2
    if-eqz v3, :cond_c7

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :cond_c7
    move-object v2, v12

    goto/16 :goto_10

    :catch_ca
    move-exception v2

    move-object v3, v2

    move-object v4, v12

    move-object v2, v11

    :goto_ce
    :try_start_ce
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error in peekHits fetching hitIds: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V
    :try_end_e8
    .catchall {:try_start_ce .. :try_end_e8} :catchall_16e

    if-eqz v4, :cond_10

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    goto/16 :goto_10

    :catchall_ef
    move-exception v2

    :goto_f0
    if-eqz v12, :cond_f5

    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    :cond_f5
    throw v2

    :cond_f6
    :try_start_f6
    const-string v5, "HitString for hitId %d too large.  Hit will be deleted."

    const/4 v2, 0x1

    new-array v6, v2, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-interface {v12, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/tagmanager/zzaq;

    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/zzaq;->zzAe()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V
    :try_end_113
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_f6 .. :try_end_113} :catch_114
    .catchall {:try_start_f6 .. :try_end_113} :catchall_166

    goto :goto_ba

    :catch_114
    move-exception v2

    move-object v13, v3

    :goto_116
    :try_start_116
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error in peekHits fetching hit url: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v4, 0x0

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_13a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_152

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/tagmanager/zzaq;

    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/zzaq;->zzAg()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_14d
    .catchall {:try_start_116 .. :try_end_14d} :catchall_15f

    move-result v6

    if-eqz v6, :cond_15b

    if-eqz v4, :cond_15a

    :cond_152
    if-eqz v13, :cond_157

    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    :cond_157
    move-object v2, v3

    goto/16 :goto_10

    :cond_15a
    const/4 v4, 0x1

    :cond_15b
    :try_start_15b
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_15e
    .catchall {:try_start_15b .. :try_end_15e} :catchall_15f

    goto :goto_13a

    :catchall_15f
    move-exception v2

    :goto_160
    if-eqz v13, :cond_165

    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    :cond_165
    throw v2

    :catchall_166
    move-exception v2

    move-object v13, v3

    goto :goto_160

    :catch_169
    move-exception v2

    goto :goto_116

    :catchall_16b
    move-exception v2

    move-object v12, v13

    goto :goto_f0

    :catchall_16e
    move-exception v2

    move-object v12, v4

    goto :goto_f0

    :catch_171
    move-exception v2

    move-object v3, v2

    move-object v4, v13

    move-object v2, v11

    goto/16 :goto_ce

    :catch_177
    move-exception v2

    move-object v3, v2

    move-object v4, v13

    move-object v2, v12

    goto/16 :goto_ce

    :cond_17d
    move v4, v2

    goto/16 :goto_9e
.end method
