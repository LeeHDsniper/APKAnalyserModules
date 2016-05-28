.class public abstract Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;
.super Ljava/lang/Object;
.source "VersionColumns.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BaseCursorWrapper"
.end annotation


# instance fields
.field protected final id:J


# direct methods
.method public constructor <init>(J)V
    .registers 4
    .param p1, "id"    # J

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;->id:J

    .line 18
    return-void
.end method

.method public static final isValid(Landroid/database/Cursor;)Z
    .registers 2
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 35
    if-eqz p0, :cond_10

    invoke-interface {p0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-interface {p0}, Landroid/database/Cursor;->isBeforeFirst()Z

    move-result v0

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method


# virtual methods
.method public abstract clone()Ljava/lang/Object;
.end method

.method public final getId()J
    .registers 3

    .prologue
    .line 21
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;->id:J

    return-wide v0
.end method
