.class public final Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;
.super Ljava/lang/Object;
.source "SessionDatabaseHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SessionWrapper"
.end annotation


# instance fields
.field public final creationTime:J

.field public final data:Landroid/net/Uri;

.field public final id:J

.field public final megapixels:I

.field public final orientation:I


# direct methods
.method public constructor <init>(JLandroid/net/Uri;IIJ)V
    .registers 8
    .param p1, "id"    # J
    .param p3, "data"    # Landroid/net/Uri;
    .param p4, "megapixels"    # I
    .param p5, "orientation"    # I
    .param p6, "creationTime"    # J

    .prologue
    .line 354
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 355
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->id:J

    .line 356
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->data:Landroid/net/Uri;

    .line 357
    iput p4, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->megapixels:I

    .line 358
    iput p5, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->orientation:I

    .line 359
    iput-wide p6, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->creationTime:J

    .line 360
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 364
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "SessionWrapper{id: %d, data: %s, mp: %d, orientation: %d, time: %d"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->id:J

    .line 367
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->data:Landroid/net/Uri;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->megapixels:I

    .line 369
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->orientation:I

    .line 370
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->creationTime:J

    .line 371
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    .line 364
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
