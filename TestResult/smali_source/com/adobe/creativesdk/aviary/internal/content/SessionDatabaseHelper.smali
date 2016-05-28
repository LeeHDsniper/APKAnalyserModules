.class public Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SessionDatabaseHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;,
        Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;
    }
.end annotation


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    const-string v0, "SessionDatabaseHelper"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    const-string v0, "aviary.sessions.sqlite"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 38
    return-void
.end method

.method private printDatabaseStats()V
    .registers 25

    .prologue
    .line 191
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "=== DATABASE STATS ==="

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 192
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 193
    .local v2, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "UTC"

    invoke-static {v3}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v12

    .line 194
    .local v12, "cal":Ljava/util/Calendar;
    invoke-virtual {v12}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v20

    .line 196
    .local v20, "time":J
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "current time: %d (%s)"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual {v12}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 198
    const-string v3, "sessions"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 199
    .local v10, "c":Landroid/database/Cursor;
    if-eqz v10, :cond_db

    .line 200
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "total sessions: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 201
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_d8

    .line 203
    :cond_68
    const-string v3, "session_id"

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    .line 204
    .local v13, "col1":I
    const-string v3, "session_data"

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v14

    .line 205
    .local v14, "col2":I
    const-string v3, "session_creation_time"

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    .line 207
    .local v15, "col3":I
    invoke-interface {v10, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    .line 208
    .local v18, "sessionId":J
    invoke-interface {v10, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    .line 209
    .local v23, "uri":Ljava/lang/String;
    invoke-interface {v10, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v16

    .line 211
    .local v16, "ctime":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SELECT COUNT(*) as _count FROM actions WHERE action_session_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, v18

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 215
    .local v11, "c2":Landroid/database/Cursor;
    const/16 v22, 0x0

    .line 216
    .local v22, "totalActions":I
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_ad

    .line 217
    const/4 v3, 0x0

    invoke-interface {v11, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v22

    .line 219
    :cond_ad
    invoke-static {v11}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 221
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "session: %d, uri: %s, created: %d, actions: %d"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object v23, v5, v6

    const/4 v6, 0x2

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 222
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_68

    .line 224
    .end local v11    # "c2":Landroid/database/Cursor;
    .end local v13    # "col1":I
    .end local v14    # "col2":I
    .end local v15    # "col3":I
    .end local v16    # "ctime":I
    .end local v18    # "sessionId":J
    .end local v22    # "totalActions":I
    .end local v23    # "uri":Ljava/lang/String;
    :cond_d8
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 227
    :cond_db
    const-string v3, "sessions"

    const/4 v4, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "session_creation_time<"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-wide/32 v6, 0x5265c00

    sub-long v6, v20, v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v17

    .line 235
    .local v17, "cursor":Landroid/database/Cursor;
    if-eqz v17, :cond_128

    .line 236
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "we need to delete: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " loitering sessions"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 237
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V

    .line 239
    :cond_128
    return-void
.end method

.method private printSessionStats(J)V
    .registers 20
    .param p1, "sessionId"    # J

    .prologue
    .line 242
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "=== SESSION STATS %d ==="

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 243
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 244
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 245
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "actions"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 246
    const/4 v2, 0x0

    const-string v3, "action_session_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    .line 250
    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "action_id ASC"

    .line 246
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 254
    .local v9, "c":Landroid/database/Cursor;
    :goto_34
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_97

    .line 255
    const-string v2, "action_id"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    .line 256
    .local v10, "id":J
    const-string v2, "action_session_id"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14

    .line 257
    .local v14, "session":J
    const-string v2, "action_bitmap_ptr"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    .line 258
    .local v12, "ptr":J
    new-instance v8, Ljava/lang/String;

    const-string v2, "action_action"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-direct {v8, v2, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 259
    .local v8, "actions":Ljava/lang/String;
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "id: %d, session: %d, ptr: %d (0x%x), actions: %s"

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x4

    aput-object v8, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_34

    .line 262
    .end local v8    # "actions":Ljava/lang/String;
    .end local v10    # "id":J
    .end local v12    # "ptr":J
    .end local v14    # "session":J
    :cond_97
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 263
    return-void
.end method

.method private purgeDatabase()V
    .registers 13

    .prologue
    .line 180
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "purgeDatabase"

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 182
    const-string v5, "UTC"

    invoke-static {v5}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 183
    .local v0, "cal":Ljava/util/Calendar;
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    .line 185
    .local v2, "time":J
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 186
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v5, "sessions"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "session_creation_time<"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-wide/32 v8, 0x5265c00

    sub-long v8, v2, v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v1, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    .line 187
    .local v4, "total":I
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "deleted "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " loitering sessions"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 188
    return-void
.end method


# virtual methods
.method public deleteActions(J)I
    .registers 12
    .param p1, "sessionId"    # J

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 161
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "deleteActions(session: %d)"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 162
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 163
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "actions"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "action_session_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 164
    .local v1, "total":I
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "deleted %d actions"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 165
    return v1
.end method

.method public deleteActionsFrom(JJ)I
    .registers 14
    .param p1, "sessionId"    # J
    .param p3, "actionId"    # J

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 169
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "deleteActionsFrom(session: %d, action: %d)"

    new-array v4, v8, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 170
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 171
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "actions"

    const-string v3, "action_session_id=? AND action_id>?"

    new-array v4, v8, [Ljava/lang/String;

    .line 174
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    .line 171
    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 175
    .local v1, "total":I
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "deleted %d actions"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 176
    return v1
.end method

.method public deleteSession(J)I
    .registers 12
    .param p1, "sessionId"    # J

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 152
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "delete(session: %d)"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 154
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 155
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "sessions"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "session_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 156
    .local v1, "total":I
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "deleted %d sessions"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 157
    return v1
.end method

.method public findActionByBitmap(JJ)J
    .registers 16
    .param p1, "sessionId"    # J
    .param p3, "ptr"    # J

    .prologue
    const/4 v9, 0x1

    const/4 v5, 0x0

    const/4 v7, 0x0

    .line 266
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 267
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 268
    .local v0, "qb":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "actions"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 270
    new-array v2, v9, [Ljava/lang/String;

    const-string v3, "action_id"

    aput-object v3, v2, v7

    const-string v3, "action_session_id=? AND action_bitmap_ptr=?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    .line 274
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v7

    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v9

    move-object v6, v5

    move-object v7, v5

    .line 270
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 280
    .local v8, "c":Landroid/database/Cursor;
    :try_start_2e
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 281
    const/4 v2, 0x0

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getLong(I)J
    :try_end_38
    .catchall {:try_start_2e .. :try_end_38} :catchall_43

    move-result-wide v2

    .line 284
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 286
    :goto_3c
    return-wide v2

    .line 284
    :cond_3d
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 286
    const-wide/16 v2, -0x1

    goto :goto_3c

    .line 284
    :catchall_43
    move-exception v2

    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v2
.end method

.method public findActionGreaterThan(JJ)Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;
    .registers 20
    .param p1, "sessionId"    # J
    .param p3, "actionId"    # J

    .prologue
    .line 290
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 291
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 292
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "actions"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 294
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v12, 0x0

    const-string v13, "action_id"

    aput-object v13, v2, v12

    const/4 v12, 0x1

    const-string v13, "action_session_id"

    aput-object v13, v2, v12

    const/4 v12, 0x2

    const-string v13, "action_bitmap_ptr"

    aput-object v13, v2, v12

    const/4 v12, 0x3

    const-string v13, "action_action"

    aput-object v13, v2, v12

    const-string v3, "action_session_id=? AND action_id>?"

    const/4 v12, 0x2

    new-array v4, v12, [Ljava/lang/String;

    const/4 v12, 0x0

    .line 301
    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v4, v12

    const/4 v12, 0x1

    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v4, v12

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "action_id ASC"

    const-string v8, "0, 1"

    .line 294
    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 307
    .local v11, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x0

    .line 309
    .local v3, "result":Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_62

    .line 310
    const/4 v2, 0x0

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 311
    .local v4, "id":J
    const/4 v2, 0x1

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 312
    .local v6, "sessionId2":J
    const/4 v2, 0x2

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 313
    .local v8, "ptr":J
    const/4 v2, 0x3

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v10

    .line 314
    .local v10, "actions":[B
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;

    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;
    invoke-direct/range {v3 .. v10}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;-><init>(JJJ[B)V

    .line 316
    .end local v4    # "id":J
    .end local v6    # "sessionId2":J
    .end local v8    # "ptr":J
    .end local v10    # "actions":[B
    .restart local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;
    :cond_62
    invoke-static {v11}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 317
    return-object v3
.end method

.method public findSession(J)Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;
    .registers 16
    .param p1, "sessionId"    # J

    .prologue
    .line 321
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 322
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 323
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v11, "sessions"

    invoke-virtual {v0, v11}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 325
    const/4 v11, 0x5

    new-array v2, v11, [Ljava/lang/String;

    const/4 v11, 0x0

    const-string v12, "session_id"

    aput-object v12, v2, v11

    const/4 v11, 0x1

    const-string v12, "session_data"

    aput-object v12, v2, v11

    const/4 v11, 0x2

    const-string v12, "session_mp"

    aput-object v12, v2, v11

    const/4 v11, 0x3

    const-string v12, "session_orientation"

    aput-object v12, v2, v11

    const/4 v11, 0x4

    const-string v12, "session_creation_time"

    aput-object v12, v2, v11

    const-string v3, "session_id=?"

    const/4 v11, 0x1

    new-array v4, v11, [Ljava/lang/String;

    const/4 v11, 0x0

    .line 329
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v4, v11

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 325
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 331
    .local v10, "cursor":Landroid/database/Cursor;
    const/4 v2, 0x0

    .line 333
    .local v2, "result":Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v11

    if-eqz v11, :cond_66

    .line 334
    const/4 v11, 0x0

    invoke-interface {v10, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    .line 335
    .local v3, "id":J
    const/4 v11, 0x1

    invoke-interface {v10, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 336
    .local v5, "uri":Landroid/net/Uri;
    const/4 v11, 0x2

    invoke-interface {v10, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    .line 337
    .local v6, "megapixels":I
    const/4 v11, 0x3

    invoke-interface {v10, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 338
    .local v7, "orientation":I
    const/4 v11, 0x4

    invoke-interface {v10, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 339
    .local v8, "time":J
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;

    .end local v2    # "result":Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;
    invoke-direct/range {v2 .. v9}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;-><init>(JLandroid/net/Uri;IIJ)V

    .line 341
    .end local v3    # "id":J
    .end local v5    # "uri":Landroid/net/Uri;
    .end local v6    # "megapixels":I
    .end local v7    # "orientation":I
    .end local v8    # "time":J
    .restart local v2    # "result":Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;
    :cond_66
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 343
    return-object v2
.end method

.method public load(Ljava/lang/String;II)J
    .registers 15
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "megapixels"    # I
    .param p3, "orientation"    # I

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 94
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "load(uri: %s, megapixels: %d, orientation: %d)"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p1, v6, v9

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v10

    const/4 v7, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 96
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 99
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 101
    .local v1, "sessionValues":Landroid/content/ContentValues;
    const-string v4, "session_data"

    invoke-virtual {v1, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    const-string v4, "session_mp"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 103
    const-string v4, "session_orientation"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 106
    :try_start_3b
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 107
    const-string v4, "sessions"

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    .line 108
    .local v2, "result":J
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_48
    .catchall {:try_start_3b .. :try_end_48} :catchall_61

    .line 110
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 113
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "result: %d"

    new-array v6, v10, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 115
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->purgeDatabase()V

    .line 116
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->printDatabaseStats()V

    .line 118
    return-wide v2

    .line 110
    .end local v2    # "result":J
    :catchall_61
    move-exception v4

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v4
.end method

.method public onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 47
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_10

    .line 49
    const-string v0, "PRAGMA foreign_keys=ON;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 50
    const-string v0, "PRAGMA encoding=\"UTF-8\";"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 52
    :cond_10
    return-void
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 13
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 56
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "onCreate"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 58
    const-string v2, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER NOT NULL DEFAULT 0, %s INTEGER NOT NULL DEFAULT 0, %s INTEGER NOT NULL DEFAULT (strftime(\'%%s\', datetime(current_timestamp))))"

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "sessions"

    aput-object v4, v3, v6

    const-string v4, "session_id"

    aput-object v4, v3, v7

    const-string v4, "session_data"

    aput-object v4, v3, v8

    const-string v4, "session_mp"

    aput-object v4, v3, v9

    const-string v4, "session_orientation"

    aput-object v4, v3, v10

    const/4 v4, 0x5

    const-string v5, "session_creation_time"

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 68
    .local v1, "sessionTable":Ljava/lang/String;
    const-string v2, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s BLOB, %s BLOB, FOREIGN KEY(%s) REFERENCES %s(%s) ON DELETE CASCADE)"

    const/16 v3, 0x9

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "actions"

    aput-object v4, v3, v6

    const-string v4, "action_id"

    aput-object v4, v3, v7

    const-string v4, "action_session_id"

    aput-object v4, v3, v8

    const-string v4, "action_bitmap_ptr"

    aput-object v4, v3, v9

    const-string v4, "action_action"

    aput-object v4, v3, v10

    const/4 v4, 0x5

    const-string v5, "action_recipe"

    aput-object v5, v3, v4

    const/4 v4, 0x6

    const-string v5, "action_session_id"

    aput-object v5, v3, v4

    const/4 v4, 0x7

    const-string v5, "sessions"

    aput-object v5, v3, v4

    const/16 v4, 0x8

    const-string v5, "session_id"

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "actionTable":Ljava/lang/String;
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 85
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 86
    return-void
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 42
    invoke-super {p0, p1}, Landroid/database/sqlite/SQLiteOpenHelper;->onOpen(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 43
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 9
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 90
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onUpgrade from %d to %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 91
    return-void
.end method

.method public push(JJLcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)J
    .registers 19
    .param p1, "sessionId"    # J
    .param p3, "bitmapPtr"    # J
    .param p5, "actionList"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .prologue
    .line 122
    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v9, "push(session:%d, bitmap: 0x%x)"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-static/range {p3 .. p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-interface {v8, v9, v10}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 124
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 126
    .local v3, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, ""

    .line 128
    .local v2, "actions":Ljava/lang/String;
    if-eqz p5, :cond_2b

    .line 130
    :try_start_20
    new-instance v8, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;

    invoke-direct {v8}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;-><init>()V

    move-object/from16 v0, p5

    invoke-static {v0, v8}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/JSONWriter;->encode(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;)Ljava/lang/String;
    :try_end_2a
    .catch Lorg/json/JSONException; {:try_start_20 .. :try_end_2a} :catch_68

    move-result-object v2

    .line 137
    :cond_2b
    :goto_2b
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 138
    .local v5, "values":Landroid/content/ContentValues;
    const-string v8, "action_session_id"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 139
    const-string v8, "action_bitmap_ptr"

    invoke-static/range {p3 .. p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 140
    const-string v8, "action_action"

    invoke-virtual {v5, v8, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    const-string v8, "action_recipe"

    invoke-virtual {v5, v8}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 143
    const-string v8, "actions"

    const/4 v9, 0x0

    invoke-virtual {v3, v8, v9, v5}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v6

    .line 144
    .local v6, "result":J
    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v9, "result: %d"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-interface {v8, v9, v10}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 146
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->printSessionStats(J)V

    .line 148
    return-wide v6

    .line 131
    .end local v5    # "values":Landroid/content/ContentValues;
    .end local v6    # "result":J
    :catch_68
    move-exception v4

    .line 132
    .local v4, "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    .line 133
    const-string v2, ""

    goto :goto_2b
.end method
