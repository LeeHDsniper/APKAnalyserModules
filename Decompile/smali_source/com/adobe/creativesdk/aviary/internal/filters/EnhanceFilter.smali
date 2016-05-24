.class public Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.source "EnhanceFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 4

    .prologue
    .line 29
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "enhance"

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;-><init>([Ljava/lang/String;)V

    .line 30
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;->HiDef:Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;->setType(Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;)V

    .line 31
    return-void
.end method


# virtual methods
.method public setType(Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;)V
    .registers 6
    .param p1, "type"    # Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;

    .prologue
    .line 41
    monitor-enter p0

    .line 42
    :try_start_1
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;->name()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    monitor-exit p0

    .line 44
    return-void

    .line 43
    :catchall_19
    move-exception v0

    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_19

    throw v0
.end method
