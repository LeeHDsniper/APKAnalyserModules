.class public final Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;
.super Ljava/lang/Object;
.source "SystemUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MemoryInfo"
.end annotation


# static fields
.field private static final PROCFS_MEMFILE_FORMAT:Ljava/util/regex/Pattern;

.field private static mValues:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sRuntimeTotalMemory:D

.field private static sSystemTotalMemory:D


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const-wide/high16 v2, -0x4010000000000000L

    .line 114
    const-string v0, "^*([0-9]*)[ \t]kB"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->PROCFS_MEMFILE_FORMAT:Ljava/util/regex/Pattern;

    .line 115
    sput-wide v2, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->sRuntimeTotalMemory:D

    .line 116
    sput-wide v2, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->sSystemTotalMemory:D

    return-void
.end method

.method private static getMemoryValue(Ljava/lang/String;)D
    .registers 7
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 193
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->mValues:Ljava/util/HashMap;

    if-nez v4, :cond_7

    .line 194
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->init()V

    .line 197
    :cond_7
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->mValues:Ljava/util/HashMap;

    invoke-virtual {v4, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_32

    .line 198
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->mValues:Ljava/util/HashMap;

    invoke-virtual {v4, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 200
    .local v1, "value":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->PROCFS_MEMFILE_FORMAT:Ljava/util/regex/Pattern;

    invoke-virtual {v4, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 201
    .local v0, "mat":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_32

    .line 202
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 203
    .local v2, "ramSize":J
    const-wide/16 v4, 0x400

    div-long v4, v2, v4

    long-to-double v4, v4

    .line 207
    .end local v0    # "mat":Ljava/util/regex/Matcher;
    .end local v1    # "value":Ljava/lang/String;
    .end local v2    # "ramSize":J
    :goto_31
    return-wide v4

    :cond_32
    const-wide/high16 v4, -0x4010000000000000L

    goto :goto_31
.end method

.method public static getRuntimeMemory([D)V
    .registers 11
    .param p0, "outValues"    # [D

    .prologue
    const-wide/high16 v8, 0x4130000000000000L

    .line 159
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v6

    long-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    div-double v4, v6, v8

    .line 160
    .local v4, "used":D
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v6

    long-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    div-double v2, v6, v8

    .line 161
    .local v2, "total":D
    sub-double v0, v2, v4

    .line 163
    .local v0, "free":D
    const/4 v6, 0x0

    aput-wide v0, p0, v6

    .line 164
    const/4 v6, 0x1

    aput-wide v4, p0, v6

    .line 165
    const/4 v6, 0x2

    aput-wide v2, p0, v6

    .line 166
    return-void
.end method

.method public static getRuntimeTotalMemory()D
    .registers 6

    .prologue
    .line 169
    sget-wide v2, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->sRuntimeTotalMemory:D

    const-wide/16 v4, 0x0

    cmpg-double v1, v2, v4

    if-gez v1, :cond_13

    .line 170
    const/4 v1, 0x3

    new-array v0, v1, [D

    .line 171
    .local v0, "mem":[D
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->getRuntimeMemory([D)V

    .line 172
    const/4 v1, 0x2

    aget-wide v2, v0, v1

    sput-wide v2, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->sRuntimeTotalMemory:D

    .line 174
    :cond_13
    const-string v1, "SystemUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sRuntimeTotalMemory: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-wide v4, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->sRuntimeTotalMemory:D

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    sget-wide v2, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->sRuntimeTotalMemory:D

    return-wide v2
.end method

.method public static getSystemTotalMemory()D
    .registers 4

    .prologue
    .line 185
    sget-wide v0, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->sSystemTotalMemory:D

    const-wide/16 v2, 0x0

    cmpg-double v0, v0, v2

    if-gez v0, :cond_10

    .line 186
    const-string v0, "MemTotal"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->getMemoryValue(Ljava/lang/String;)D

    move-result-wide v0

    sput-wide v0, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->sSystemTotalMemory:D

    .line 189
    :cond_10
    sget-wide v0, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->sSystemTotalMemory:D

    return-wide v0
.end method

.method private static init()V
    .registers 2

    .prologue
    .line 122
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->mValues:Ljava/util/HashMap;

    .line 123
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->mValues:Ljava/util/HashMap;

    const-string v1, "/proc/meminfo"

    # invokes: Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->readValues(Ljava/util/HashMap;Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->access$000(Ljava/util/HashMap;Ljava/lang/String;)V

    .line 124
    return-void
.end method
