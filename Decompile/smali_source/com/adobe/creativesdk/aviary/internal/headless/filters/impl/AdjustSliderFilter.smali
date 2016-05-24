.class public abstract Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustSliderFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.source "AdjustSliderFilter.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "toolname"    # Ljava/lang/String;

    .prologue
    .line 11
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;-><init>([Ljava/lang/String;)V

    .line 12
    return-void
.end method


# virtual methods
.method public abstract setAdjustTool(ID)V
.end method
