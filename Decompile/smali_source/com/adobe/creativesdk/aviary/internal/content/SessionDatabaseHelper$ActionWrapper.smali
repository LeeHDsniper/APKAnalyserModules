.class public final Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;
.super Ljava/lang/Object;
.source "SessionDatabaseHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ActionWrapper"
.end annotation


# instance fields
.field public final actions:Ljava/lang/String;

.field public final bitmapPtr:J

.field public final id:J

.field public final sessionId:J


# direct methods
.method public constructor <init>(JJJ[B)V
    .registers 9
    .param p1, "id"    # J
    .param p3, "sessionId"    # J
    .param p5, "bitmapPtr"    # J
    .param p7, "actions"    # [B

    .prologue
    .line 381
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 382
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;->id:J

    .line 383
    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;->sessionId:J

    .line 384
    iput-wide p5, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;->bitmapPtr:J

    .line 385
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p7}, Ljava/lang/String;-><init>([B)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;->actions:Ljava/lang/String;

    .line 386
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 390
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "ActionWrapper{id: %d, session_id: %d, bitmap_ptr: %d, actions: %s}"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;->id:J

    .line 393
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;->sessionId:J

    .line 394
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;->bitmapPtr:J

    .line 395
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;->actions:Ljava/lang/String;

    aput-object v4, v2, v3

    .line 390
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
