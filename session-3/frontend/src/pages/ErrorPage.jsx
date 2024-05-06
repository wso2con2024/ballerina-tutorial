/**
 * Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import {
    Box,
    Button,
    Typography
} from "@mui/material";
import { useNavigate } from "react-router-dom";
import PageContent from "../components/PageContent";

export default function Errorpage() {
    const navigate = useNavigate()

    return (
        <PageContent>
            <Box sx={{
                minHeight: "75vh",
                display: "flex",
                flexDirection: "column",
                justifyContent: "center",
                alignItems: "center",
            }}>
                <Typography
                    component="h1"
                    variant="h1"
                    textAlign="center"
                    sx={{ margin: "1rem 0", }}
                >
                    404, Not Found!
                </Typography>

                <Button
                    size="large"
                    variant="contained"
                    color="primary"
                    sx={{ color: "#ffffff" }}
                    onClick={() => navigate("/")}
                >
                    Go Back
                </Button>
            </Box>
        </PageContent>
    )
}
